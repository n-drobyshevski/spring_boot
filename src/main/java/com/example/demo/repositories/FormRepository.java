package com.example.demo.repositories;

import com.example.demo.models.Cart;
import com.example.demo.models.Form;
import com.example.demo.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface FormRepository extends JpaRepository<Form,Long> {
    @Query(value = "SELECT * FROM form WHERE name = ?; ", nativeQuery=true)
    Cart findAllByName(String name);

}
