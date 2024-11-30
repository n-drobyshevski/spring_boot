package com.example.demo.controllers;

import com.example.demo.models.Cart;
import com.example.demo.serveces.CartService;
import com.example.demo.serveces.UserService;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;
    private final UserService userService;

    @GetMapping("/cart")
    public String get(Model model, Principal principal) {
        List<Cart> carts = cartService.getAll();
        model.addAttribute("carts", carts);
        model.addAttribute("role", userService.getUserRole(principal));
        model.addAttribute("userId", userService.getUserId(principal));
        return "cart";
    }

    @GetMapping("/getAllCart")
    public List<Cart> getAll() {
        return cartService.getAll();
    } // выводит всю инфу из бд в корзину

    @PostMapping("/AddToCart")
    public String addToCart(Cart cart) {
        System.out.println(cart);
        cartService.addToCart(cart);
        return "redirect:/books";
    }

    @PostMapping("/AddItemToCart")
    public String AddItemToCart(Cart cart) {
        System.out.println(cart);
        cartService.addToCart(cart);
        return "redirect:/someBooks";
    }

    @PostMapping("/cartDelete")
    public String deleteCartT(Cart id) {
        System.out.println(id);
        cartService.deleteCart(id.getId());
        return "redirect:/cart";
    }

    @PostMapping("/clearDelete")
    public String clearDelete(Principal principal) {
        System.out.println("Сработало очистка");
        cartService.clearCart(userService.getUserId(principal));
        return "redirect:/cart";
    }

    @PostMapping("/buyCart")
    public String buyCart() {
        System.out.println("Купили корзину");
        boolean success = cartService.buyCart();
        if (success) {
            return "redirect:/success";
        } else {
            return "redirect:/cart";
        }
    }
    
    @GetMapping("/success")
    public String success(Model model, Principal principal) {
        model.addAttribute("role", userService.getUserRole(principal));
        model.addAttribute("userId", userService.getUserId(principal));
        return "purchase_success";
    }

    public Long read() {
        try {
            try (BufferedReader reader = new BufferedReader(new FileReader("file.txt"))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    System.out.println(line);
                    return Long.valueOf(line);
                }
            }
        } catch (IOException e) {
            System.out.println("An error occurred while reading the file.");
            e.printStackTrace();

        }
        return 0L;
    }

    // @PostMapping("/cartDeleteOfProduct")
    // public String deleteCart(Cart id) {
    // System.out.println(id);
    // cartService.deleteCart(id.getId());
    // return "redirect:/";
    // }

}