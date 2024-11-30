package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SortsOfFlowersController {
    @GetMapping("/sorts")
    public String sortsMain(Model model)
    {        return "sorts";
    }
}