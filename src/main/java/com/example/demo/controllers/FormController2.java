package com.example.demo.controllers;
import com.example.demo.models.Form;
import com.example.demo.serveces.FormService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class FormController2 {

    private final FormService formService;

    @GetMapping("/form")
    public String getModel(Model model) {
        List<Form> forms = formService.getAll();
        model.addAttribute("forms", forms);
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
