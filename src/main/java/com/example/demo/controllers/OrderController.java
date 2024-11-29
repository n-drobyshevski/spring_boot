package com.example.demo.controllers;

import com.example.demo.models.Cart;
import com.example.demo.models.Order;
import com.example.demo.models.User;
import com.example.demo.serveces.CartService;
import com.example.demo.serveces.OrderService;
import com.example.demo.serveces.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/orders")
public class OrderController {

    private final OrderService orderService;
    private final CartService cartService;
    private final UserService userService;

    public OrderController(OrderService orderService, CartService cartService, UserService userService) {
        this.orderService = orderService;
        //this.cartService = cartService;
        this.cartService = cartService;
        this.userService = userService;
    }


//    @GetMapping("/form")
//    public String showOrderForm(Model model, Principal principal) {
//        // Добавляем пустой объект заказа для формы
//        model.addAttribute("order", new Order());
//        String username = SecurityContextHolder.getContext().getAuthentication().getName();
//        User user = userService.findByName(username);
//
//        // Загружаем корзину текущего пользователя
//        Cart cart = cartService.findById(user.getId());
//        model.addAttribute("cart", cart); // Передача корзины в модель
//
//        return "cart"; // Имя шаблона FreeMarker
//    }


//    @PostMapping("/create")
//    public String createOrder(@ModelAttribute("order") Order order, User user, Cart cart) {
//        String email = user.getEmail(); // Получаем email из аккаунта
//        order.setEmail(email);
//        String nameproduct = cart.getNameproduct(); // Получаем email из аккаунта
//        order.setBookTitles(nameproduct);
//        orderService.createOrder(order);
//        return "redirect:/orders/my"; // Перенаправляем на страницу с заказами
//    }

    @PostMapping("/create")
    public String createOrder(@ModelAttribute("order") Order order,
                              @ModelAttribute("cart") Cart cart,
                              Principal principal) {
        // Получаем email текущего пользователя из Principal
        String email = principal.getName();
        order.setEmail(email);

        // Получаем название продукта из корзины
        String nameProduct = cart.getNameproduct();
        order.setBookTitles(nameProduct);

        // Сохраняем заказ
        orderService.createOrder(order);

        return "redirect:/orders/my"; // Перенаправляем на страницу с заказами
    }


    @GetMapping("/my")
    public String viewMyOrders(Model model, User user) {
        String email = user.getEmail();
        List<Order> orders = orderService.getOrdersByEmail(email);
        model.addAttribute("orders", orders);
        return "my-orders"; // шаблон FTLH для отображения заказов пользователя
    }

    @GetMapping("/admin")
    public String viewAllOrders(Model model) {
        List<Order> orders = orderService.getAllOrders();
        model.addAttribute("orders", orders);
        return "admin-orders"; // шаблон FTLH для отображения всех заказов
    }

    @PostMapping("/update-status")
    public String updateOrderStatus(@RequestParam Long orderId, @RequestParam String status) {
        orderService.updateOrderStatus(orderId, status);
        return "redirect:/orders/admin";
    }
}
