package com.example.demo.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class HeadController0 {
    @GetMapping("/head")
    public String headMain(Model model)
    {        return "head";
    }
}