package com.example.demo.controllers;


import java.io.IOException;
import java.security.Principal;

import com.example.demo.models.Books;
import com.example.demo.models.Compilation;
import com.example.demo.models.Image;
import com.example.demo.serveces.CompilationService; // Ensure this class exists in the specified package
import com.example.demo.serveces.UserService;

import lombok.RequiredArgsConstructor;

import com.example.demo.repositories.ImageRepository;
import com.example.demo.serveces.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class CompilationController {

    private final CompilationService compilationService;
    private final ImageRepository imageRepository;
    private final UserService UserService;

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
    
    @PostMapping("/admin/compilations/create")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String createCompilation(@RequestParam("file1") MultipartFile file1,
            Compilation compilation, Principal principal) throws IOException{
        compilationService.saveCompilation(principal, compilation, file1);

        return "redirect:/admin";
    }

    @PostMapping("/compilations/delete/{ID}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String deleteCompilation(@PathVariable Long ID) {
        compilationService.deleteCompilation(ID);
        return "redirect:/admin";
    }
    
    @GetMapping("/compilations/edit/{ID}")
    @PreAuthorize("hasAuthority('ROLE_ADMIN')")
    public String editCompilationForm(@PathVariable Long ID, Model model, Principal principal) {
        Compilation compilation = compilationService.getCompilationById(ID);
        if (compilation == null) {
            throw new RuntimeException("compilation not found with ID: " + ID);
        }
        model.addAttribute("compilation", compilation);
        model.addAttribute("userId", UserService.getUserId(principal));
        model.addAttribute("role", UserService.getUserRole(principal));
        return "compilation-edit";
    }

    @PostMapping("/compilations/edit/{ID}")
    public String editCompilation(@PathVariable Long ID, @RequestParam("file1") MultipartFile file1,
            Compilation compilation, Principal principal) throws IOException {
        compilationService.editCompilation(ID, file1, compilation, principal);
        return "redirect:/compilations/" + ID;
    }
}