package com.example.demo.controllers;

import com.example.demo.models.Compilation;
import com.example.demo.serveces.CompilationService; // Ensure this class exists in the specified package
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

    @GetMapping("/compilations")
    public String getAllCompilations(Model model) {
        List<Compilation> compilations = compilationService.getAllCompilations();
        model.addAttribute("compilations", compilations);
        return "compilationsMain";
    }

    @GetMapping("/compilations/{id}")
    public String getCompilationById(@PathVariable Long id, Model model) {
        Compilation compilation = compilationService.getCompilationById(id);
        model.addAttribute("compilation", compilation);
        return "compilation";
    }
}