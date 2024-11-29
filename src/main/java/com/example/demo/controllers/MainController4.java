package com.example.demo.controllers;

import com.example.demo.models.Tovar;
import com.example.demo.serveces.CartService;
import com.example.demo.serveces.HistoryService;
import com.example.demo.serveces.ProductServicts;
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

@Controller
@RequiredArgsConstructor
public class MainController4 {
    private final ProductServicts productServicts;
    public final CartService cartService;
    public final HistoryService historyService;
    @GetMapping("/")
    public String product(@RequestParam(name = "title",required = false) String title,Principal principal, Model model) {
        model.addAttribute("products",productServicts.listTovar(title));
        model.addAttribute("cart",cartService.list());
        model.addAttribute("user",productServicts.getUserByPrincipal(principal));
        model.addAttribute("user",productServicts.getUserByPrincipal(principal));
        model.addAttribute("historys",historyService.getAll());

        return "product";
    }
    @GetMapping("/product/{ID}")
    public String productInfo(@PathVariable Long ID,Model model){
        Tovar product=productServicts.getProductByID(ID);
        model.addAttribute("product",product);
        model.addAttribute("image",product.getImages());
        return"product.info";
    }
    @PostMapping("/product/create")
    public String createProduct(@RequestParam("file1") MultipartFile file1,
                                @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3,
                                Tovar product , Principal principal)throws IOException {
        productServicts.saveTovar(principal,product,file1,file2,file3);
        return "redirect:/";
    }
    @PostMapping("/product/delete/{ID}")
    public String deleteProduct(@PathVariable Long ID){
        productServicts.deleteTovar(ID);
        return"redirect:/";
    }
}