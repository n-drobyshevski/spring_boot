package com.example.demo.controllers;

import com.example.demo.models.Books;
import com.example.demo.models.Compilation;
import com.example.demo.models.History;
import com.example.demo.models.User;
import com.example.demo.models.enums.Role;
import com.example.demo.repositories.ImageRepository;
import com.example.demo.serveces.HistoryService;
import com.example.demo.serveces.BooksService;
import com.example.demo.serveces.UserService;
import com.example.demo.serveces.CompilationService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    private final BooksService booksService;
    private final CompilationService compilationService;

    @GetMapping("/admin")
    public String admin(Model model, Principal principal) {
        List<History> histories = historyService.getAllHistories();
        model.addAttribute("histories", histories);
        model.addAttribute("users", userService.list());
        model.addAttribute("books", booksService.list());
        model.addAttribute("images", imageRepository.findAll());
        model.addAttribute("role", userService.getUserRole(principal));
        model.addAttribute("userId", userService.getUserId(principal));
        
        List<Compilation> compilations = compilationService.getAllCompilations();
        model.addAttribute("compilations", compilations);

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


    @GetMapping("/admin/compilations/edit/{id}")
    public String editCompilation(@PathVariable("id") Long id, Model model, Principal principal) {
        Compilation compilation = compilationService.getCompilationById(id);
        if (compilation == null) {
            return "redirect:/admin";
        }
        model.addAttribute("compilation", compilation);
        model.addAttribute("role", userService.getUserRole(principal));
        model.addAttribute("userId", userService.getUserId(principal));
        return "compilation-edit";
    }

    @PostMapping("/admin/compilations/edit")
    public String updateCompilation(@RequestParam("id") Long id, @RequestParam("name") String name,
            @RequestParam("description") String description) {
        Compilation compilation = compilationService.getCompilationById(id);
        if (compilation == null) {
            return "redirect:/admin";
        }
        compilation.setName(name);
        compilation.setDescription(description);
        compilationService.saveCompilation(compilation);
        return "redirect:/admin";
    }

    @PostMapping("/admin/createCompilation")
    public String createCompilation(@RequestParam("name") String name, @RequestParam("description") String description,
            Model model) {
        Compilation compilation = new Compilation();
        compilation.setName(name);
        compilation.setDescription(description);
        compilationService.saveCompilation(compilation);
        return "redirect:/admin";
    }
    
    @PostMapping("/admin/compilations/delete/{id}")
    public String deleteCompilation(@PathVariable("id") Long id) {
        compilationService.deleteCompilationById(id);
        return "redirect:/admin";
    }
}