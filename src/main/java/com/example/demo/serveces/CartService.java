package com.example.demo.serveces;

import com.example.demo.models.Cart;
import com.example.demo.models.Books;
import com.example.demo.models.History;
import com.example.demo.models.User;
import com.example.demo.models.enums.Role;
import com.example.demo.repositories.CartRepository;
import com.example.demo.repositories.HistoryRepository;
import com.example.demo.serveces.UserService; 
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.security.core.context.SecurityContextHolder;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.time.LocalDate;
import javax.transaction.Transactional;
import java.security.Principal;

@Service
@Slf4j
@RequiredArgsConstructor
public class CartService {
    private final UserService userService;
    public final CartRepository cartRepository;
    public final HistoryRepository historyRepository;

    public boolean addToCart(Cart cart) {
        if (cartRepository.findAllByNameProduct(cart.getNameproduct()) != null) {
            return false;
        }
        Principal principal = SecurityContextHolder.getContext().getAuthentication();
        Long ID = userService.getUserId(principal);
        cart.setUser_id(ID.intValue());
        cartRepository.save(cart);
        return true;
    }

    public void deleteCart(Long id) {
        cartRepository.deleteById(id);
    }

    public void clearCart(Long id) {
        cartRepository.deleteByUser_id(id);
    }

    @Transactional
    public boolean buyCart() {
        // Retrieve cart items for the user
        Principal principal = SecurityContextHolder.getContext().getAuthentication();
        Long userId = userService.getUserId(principal);
        List<Cart> cartItems = cartRepository.findAllByUser_id(userId.intValue());

        if (cartItems.isEmpty()) {
            return false;
        }

        // Process the purchase (e.g., move items to purchase history)
        for (Cart cartItem : cartItems) {
            // Create a new history entry
            History history = new History();
            history.setNameproduct(cartItem.getNameproduct());
            history.setCost(Integer.parseInt(cartItem.getCost()));
            history.setImage(cartItem.getImage());
            history.setUser_id(cartItem.getUser_id());

            // Save the history entry
            historyRepository.save(history);
        }

        // Clear the cart
        clearCart(userId);
        return true;
    }

    public List<Cart> getAll() {
        // return cartRepository.findAll();
        Principal principal = SecurityContextHolder.getContext().getAuthentication();
        Long ID = userService.getUserId(principal);
        return cartRepository.findAllByUser_id(ID.intValue());

    }

    public List<Cart> list() {
        return cartRepository.findAll();
    }

    @Transactional
    public void moveToHistoryAndClearCart(Long id) {
        Principal principal = SecurityContextHolder.getContext().getAuthentication();
        List<Cart> userCart = cartRepository.findAllByUser_id(userService.getUserId(principal).intValue());
        for (Cart i : userCart) {
            historyRepository
                    .save(new History(i.getId(), i.getNameproduct(), i.getCostAsInt(), i.getImage(), i.getUser_id()));
        }
        clearCart(id);
    }

    // public int read(){
    // try {
    // BufferedReader reader = new BufferedReader(new FileReader("file.txt"));
    // String line;
    // while ((line = reader.readLine()) != null) {
    // System.out.println(line);
    // return Integer.valueOf(line);
    // }
    // reader.close();
    // } catch (IOException e) {
    // System.out.println("An error occurred while reading the file.");
    // e.printStackTrace();

    // }
    // return 0;
}

// }
