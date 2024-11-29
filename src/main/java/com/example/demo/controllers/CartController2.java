package com.example.demo.controllers;
import com.example.demo.models.Cart;
import com.example.demo.serveces.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class CartController2 {

    private final CartService cartService;

    @GetMapping("/cart")
    public String get(Model model) {
        List<Cart> carts = cartService.getAll();
        model.addAttribute("carts", carts);
        return "cart";
    }
    @GetMapping("/getAllCart")
    public List<Cart> getAll(){
        return cartService.getAll();
    } //выводит всю инфу из бд в корзину

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
    public String clearDelete() {
        System.out.println("Сработало очистка");
        cartService.clearCart(read());
        return "redirect:/cart";
    }
    @PostMapping("/buyCart")
    public String buyCart() {
        System.out.println("Купили корзину");
        cartService.buyCart(read());
        return "redirect:/cart";
    }
    public Long read(){
        try {
            BufferedReader reader = new BufferedReader(new FileReader("file.txt"));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
                return Long.valueOf(line);
            }
            reader.close();
        } catch (IOException e) {
            System.out.println("An error occurred while reading the file.");
            e.printStackTrace();

        }
        return 0L;
    }

//    @PostMapping("/cartDeleteOfProduct")
//    public String deleteCart(Cart id) {
//        System.out.println(id);
//        cartService.deleteCart(id.getId());
//        return "redirect:/";
//    }

}