package com.example.demo.controllers;

import java.security.Principal;

import com.example.demo.models.Compilation;
import com.example.demo.serveces.CompilationService; // Ensure this class exists in the specified package
import com.example.demo.serveces.UserService;
import com.example.demo.serveces.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class CompilationController {

    @Autowired
    private CompilationService compilationService;
    
    @Autowired
    private UserService UserService;

    @GetMapping("/compilations")
    public String getAllCompilations(Model model, Principal principal) {
        List<Compilation> compilations = compilationService.getAllCompilations();
        model.addAttribute("compilations", compilations);
        model.addAttribute("userId", UserService.getUserId(principal));
        model.addAttribute("role", UserService.getUserRole(principal));
        return "compilationsMain";
    }

    @GetMapping("/compilations/{ID}")
    public String getCompilationById(@PathVariable Long ID, Model model, Principal principal) {
        Compilation compilation = compilationService.getCompilationById(ID);
        if (compilation == null) {
            throw new RuntimeException("compilation not found with ID: " + ID);
        }
        model.addAttribute("compilation", compilation);
        model.addAttribute("userId", UserService.getUserId(principal));
        model.addAttribute("role", UserService.getUserRole(principal));
        return "compilationDetails";
    }
}