package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import java.security.Principal;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.serveces.UserService;
@Controller
public class MailController {
    private final UserService userService;

    public MailController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/information")
    public String mailMain(Model model, Principal principal) {
        model.addAttribute("role", userService.getUserRole(principal));
        model.addAttribute("userId", userService.getUserId(principal));
        return "information";
    }
}
