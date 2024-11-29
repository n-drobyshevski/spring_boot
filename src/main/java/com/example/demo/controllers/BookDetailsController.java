package com.example.demo.controllers;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

public class BookDetailsController {

    @GetMapping("/book-details")
    public String bookDetailsMain(Model model)
    {        return "bookDetails";
    }
}
