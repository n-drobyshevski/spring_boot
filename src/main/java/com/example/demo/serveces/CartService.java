package com.example.demo.serveces;

import com.example.demo.models.Cart;
import com.example.demo.models.Books;
import com.example.demo.models.History;
import com.example.demo.models.User;
import com.example.demo.models.enums.Role;
import com.example.demo.repositories.CartRepository;
import com.example.demo.repositories.HistoryRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.time.LocalDate;
import javax.transaction.Transactional;


@Service
@Slf4j
@RequiredArgsConstructor
public class CartService {

    public final CartRepository cartRepository;
    public final HistoryRepository historyRepository;

    public boolean addToCart(Cart cart) {
        if (cartRepository.findAllByNameProduct(cart.getNameproduct()) != null) {
            return false;
        }
        int ID=read();
        cart.setUser_id(ID);
        cartRepository.save(cart);
        return true;
    }
    public void deleteCart(Long id) {
        cartRepository.deleteById(id);
    }

    public void clearCart(Long id) {
        cartRepository.deleteByUser_id(id);
    }
    public List<Cart> getAll(){
//        return cartRepository.findAll();
        int ID=read();
        return cartRepository.findAllByUser_id(ID);


    }
    public List<Cart> list(){
        return cartRepository.findAll();
    }

    public void buyCart(Long id){
        List<Cart> userCart = cartRepository.findAllByUser_id(read());
        for (Cart i: userCart){
            historyRepository.save(new History(i.getId(),i.getNameproduct(),i.getCost(),i.getImage(),i.getUser_id()));
        }
        clearCart(id);
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
