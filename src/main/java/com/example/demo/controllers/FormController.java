package com.example.demo.controllers;
import com.example.demo.models.Form;
import com.example.demo.serveces.FormService;
import com.example.demo.serveces.UserService;
import lombok.RequiredArgsConstructor;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class FormController {
    private final FormService formService;
    private final UserService userService;

    @GetMapping("/form")
    public String getModel(Model model, Principal principal) {
        model.addAttribute("role", userService.getUserRole(principal));
        model.addAttribute("forms", formService.getAll());
        model.addAttribute("role", userService.getUserRole(principal));
        model.addAttribute("userId", userService.getUserId(principal));
        return "form";
    }
    @GetMapping("/getAllForm")
    public List<Form> getAll() {
        return formService.getAll();
    }
    @PostMapping("/getForm")
    public String addToFormApp(Form form) {
        System.out.println(form);
        formService.addToFormApp(form);
        return "redirect:/form";
    }
}
