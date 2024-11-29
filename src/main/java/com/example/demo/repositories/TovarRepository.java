package com.example.demo.repositories;

import com.example.demo.models.Tovar;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TovarRepository extends JpaRepository<Tovar,Long > {
    List<Tovar> findByTitle(String title);
}
