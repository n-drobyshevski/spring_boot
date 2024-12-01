package com.example.demo.controllers;

import com.example.demo.models.Cart;
import com.example.demo.serveces.CartService;
import com.example.demo.serveces.UserService;
import com.example.demo.serveces.HistoryService;
import com.example.demo.serveces.OrderService;
import com.example.demo.models.Order;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    private final OrderService orderService;
    private static final Logger logger = LoggerFactory.getLogger(CartController.class);
    
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

    @PostMapping("/cart/buyCart")
    public String buyCart(@RequestParam("customerName") String customerName,
            @RequestParam("address") String address,
            @RequestParam("paymentMethod") String paymentMethod,
            @RequestParam("email") String email,
            Principal principal) {
        System.out.println("Купили корзину");
        Long userId = userService.getUserId(principal);
        logger.info("Attempting to buy cart for user ID: {}", userId);
        boolean success = cartService.buyCart(customerName, address, paymentMethod, email);
        if (success) {
            // Create a new order
            List<Cart> cartItems = cartService.getAll();
            StringBuilder bookTitles = new StringBuilder();
            for (Cart cartItem : cartItems) {
                bookTitles.append(cartItem.getNameproduct()).append(", ");
            }
            Order order = new Order();
            order.setCustomerName(customerName);
            order.setAddress(address);
            order.setPaymentMethod(paymentMethod);
            order.setEmail(email);
            order.setUserId(userId);
            order.setStatus("В обработке");
            order.setBookTitles(bookTitles.toString());
            orderService.createOrder(order);
            logger.info("Order created for user ID: {}", userId);
            logger.info("Order details: {}", order);
            return "redirect:/success";
        } else {
            logger.warn("Failed to buy cart for user ID: {}", userId);
            return "redirect:/cart";
        }
    }

    @GetMapping("/checkout")
    public String checkout(Model model, Principal principal) {
        Long userId = userService.getUserId(principal);
        logger.info("Checking out for user ID: {}", userId);
        model.addAttribute("role", userService.getUserRole(principal));
        model.addAttribute("userId", userService.getUserId(principal));
        List<Cart> carts = cartService.getAll();
        for (Cart cart : carts) {
            logger.info("Cart item: {}", cart);
        }
        model.addAttribute("carts", carts);
        return "checkout";
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