package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class PackageController {
    @GetMapping("/package")
    public String packageMain(Model model)
    {        return "package";
    }
}