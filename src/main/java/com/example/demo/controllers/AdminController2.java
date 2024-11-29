package com.example.demo.controllers;

import com.example.demo.models.User;
import com.example.demo.models.enums.Role;
import com.example.demo.repositories.ImageRepository;
import com.example.demo.serveces.BooksService;
import com.example.demo.serveces.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController2 {
    private final UserService userService;
    private final BooksService booksService;
    private final ImageRepository imageRepository;


    @GetMapping("/admin")
    public String admin(Model model) {
        model.addAttribute("users", userService.list());
        model.addAttribute("books", booksService.list());
        model.addAttribute("images", imageRepository.findAll());
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
    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form) {
        userService.changeUserRoles(user, form);
        return "redirect:/admin";
    }


}