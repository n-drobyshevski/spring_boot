package com.example.demo.controllers;

import com.example.demo.models.Flowers;
import com.example.demo.models.Tovar;
import com.example.demo.repositories.ImageRepository;
import com.example.demo.serveces.FlowersService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class FlowersController {
    private final FlowersService flowersService;
    private final ImageRepository imageRepository;

    @GetMapping("/flowers")
    public String product(@RequestParam(name = "title",required = false) String title,Principal principal, Model model) {
        model.addAttribute("flowers",flowersService.listFlowers(title));
        model.addAttribute("user",flowersService.getUserByPrincipal(principal));
        model.addAttribute("flowers", flowersService.list());
        model.addAttribute("images", imageRepository.findAll());
        return "flowers";
    }
    @GetMapping("/getFlowers")
    public String searchFlowersByTitle(@RequestParam(value = "title", required = false) String searchQuery, Model model) {
        List<Flowers> searchResults;
        if (searchQuery != null && !searchQuery.isEmpty()) {
            // Выполните поиск цветков по названию
            searchResults = flowersService.getFlowersByTitle(searchQuery);
        } else {
            // Если поисковый запрос пустой, отобразите все цветки
            searchResults = flowersService.getAllFlowers();
        }
        model.addAttribute("flowers", searchResults);
        return "flowers";
    }
    @GetMapping("/flowers/{ID}")
    public String productInfo(@PathVariable Long ID,Model model){
        Flowers flowers=flowersService.getFlowersByID(ID);
        model.addAttribute("flowers",flowers);
        model.addAttribute("image",flowers.getImages());
        return"admin";
    }
    @PostMapping("/flowers/create")
    public String createFlowers(@RequestParam("file1") MultipartFile file1,
                                Flowers flowers, Principal principal)throws IOException {
        flowersService.saveFlowers(principal,flowers,file1);
        return "redirect:/admin";
    }
    @PostMapping("/flowers/delete/{ID}")
    public String deleteFlowers(@PathVariable Long ID){
        flowersService.deleteFlowers(ID);
        return"redirect:/admin";
    }
}