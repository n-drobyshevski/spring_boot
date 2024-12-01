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

        // implementation to retrieve all histories

        return historyRepository.findAll();

    }
    public int read(){
        try {
            BufferedReader reader = new BufferedReader(new FileReader("file.txt"));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
                return Integer.valueOf(line);
            }
            reader.close();
        } catch (IOException e) {
            System.out.println("An error occurred while reading the file.");
            e.printStackTrace();

        }
        return 0;
    }

}
