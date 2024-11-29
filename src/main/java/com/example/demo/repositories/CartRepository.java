package com.example.demo.repositories;

import com.example.demo.models.Cart;
import com.example.demo.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.time.LocalDate;
import javax.transaction.Transactional;

import java.util.List;
@Repository
public interface CartRepository extends JpaRepository<Cart,Long> {
    @Query(value = "SELECT * FROM cart WHERE nameproduct = ?; ", nativeQuery=true)
    Cart findAllByNameProduct(String nameproduct);
    @Query(value = "SELECT * FROM cart WHERE user_id = ?; ", nativeQuery=true)
    List<Cart> findAllByUser_id(int ID);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "DELETE FROM cart WHERE user_id=?;", nativeQuery = true)
    void deleteByUser_id(Long id);


}
