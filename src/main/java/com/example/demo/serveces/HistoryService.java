package com.example.demo.serveces;

import com.example.demo.models.Cart;
import com.example.demo.models.History;
import com.example.demo.repositories.CartRepository;
import com.example.demo.serveces.UserService;
import com.example.demo.repositories.HistoryRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.security.Principal;
import java.util.List;


@Service
@Slf4j
@RequiredArgsConstructor
public class HistoryService {

    private final UserService userService;
    private final HistoryRepository historyRepository;

    public List<History> getAll(){
        Principal principal = SecurityContextHolder.getContext().getAuthentication();
        Long ID = userService.getUserId(principal);
        return historyRepository.findAllByUser_id(ID.intValue());
    }
    
    public List<History> getAllHistories() {
        return historyRepository.findAll();

    }
    
    public void storePurchase(Long userId, String customerName, String address, String paymentMethod, String email) {
        // Create a new History entity
        History history = new History();
        history.setUserId(userId.intValue());
        history.setCustomerName(customerName);
        history.setAddress(address);
        history.setPaymentMethod(paymentMethod);
        history.setEmail(email);

        // Save the History entity to the repository
        historyRepository.save(history);
    }

}
