package com.example.demo.controllers;

import com.example.demo.models.Books;
import com.example.demo.models.Compilation;
import com.example.demo.models.History;
import com.example.demo.models.Image;
import com.example.demo.models.User;
import com.example.demo.models.Order;
import com.example.demo.models.enums.Role;
import com.example.demo.repositories.ImageRepository;
import com.example.demo.serveces.HistoryService;
import com.example.demo.serveces.BooksService;
import com.example.demo.serveces.UserService;
import com.example.demo.serveces.CompilationService;
import com.example.demo.serveces.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;
import java.util.stream.Collectors;
import java.util.List;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;
    private final HistoryService historyService;
    private final ImageRepository imageRepository;
    private final CompilationService compilationService;
    private final OrderService orderService;
    private final BooksService booksService;

    @GetMapping("/admin")
    public String admin(Model model, Principal principal) {
        List<History> histories = historyService.getAllHistories();
        model.addAttribute("histories", histories);
        model.addAttribute("users", userService.list());
        model.addAttribute("books", booksService.list());
        model.addAttribute("images", imageRepository.findAll());
        model.addAttribute("role", userService.getUserRole(principal));
        model.addAttribute("userId", userService.getUserId(principal));
        

        return "admin";
    }

    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id) {
        userService.banUser(id);
        return "redirect:/admin";
    }

    @GetMapping("/admin/user/edit/{user}")
    public String userEdit(@PathVariable("user") User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "user-edit";
    }

    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") Long userId, @RequestParam Map<String, String> form) {
        User user = userService.getUserById(userId);
        if (user == null) {
            return "redirect:/admin";
        }

        // Update the user's role if it is different from the current role
        userService.changeUserRoles(user, form);
        return "redirect:/admin";
    }

    @GetMapping("/admin/users")
    public String manageUsers(Model model, Principal principal) {
        List<History> histories = historyService.getAllHistories();
        model.addAttribute("histories", histories);
        model.addAttribute("users", userService.list());
        model.addAttribute("books", booksService.list());
        model.addAttribute("images", imageRepository.findAll());
        model.addAttribute("role", userService.getUserRole(principal));
        model.addAttribute("userId", userService.getUserId(principal));

        return "admin-users";
    }

    @GetMapping("/admin/compilations")
    public String manageCompilations(Model model, Principal principal) {
        List<History> histories = historyService.getAllHistories();
        model.addAttribute("histories", histories);
        model.addAttribute("users", userService.list());
        model.addAttribute("books", booksService.list());
        model.addAttribute("images", imageRepository.findAll());
        model.addAttribute("role", userService.getUserRole(principal));
        model.addAttribute("userId", userService.getUserId(principal));
        
        List<Compilation> compilations = compilationService.getAllCompilations();
        model.addAttribute("compilations", compilations);
        return "admin-compilations";
    }
    
    @GetMapping("/admin/orders")
    public String manageOrders(Model model, Principal principal) {
        List<History> histories = historyService.getAllHistories();
        model.addAttribute("histories", histories);
        model.addAttribute("users", userService.list());
        model.addAttribute("role", userService.getUserRole(principal));
        model.addAttribute("userId", userService.getUserId(principal));
        Long userId = userService.getUserId(principal);
        List<Order> orders = orderService.getOrdersByUserId(userId);
        model.addAttribute("orders", orders);

        return "admin-orders";
    }

    @GetMapping("/admin/books")
    public String manageBooks(Model model, Principal principal) {
        model.addAttribute("books", booksService.list());
        model.addAttribute("role", userService.getUserRole(principal));
        model.addAttribute("userId", userService.getUserId(principal));
        return "admin-books";
    }

    
}