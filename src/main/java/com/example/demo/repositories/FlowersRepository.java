package com.example.demo.repositories;

import com.example.demo.models.Flowers;
import com.example.demo.models.Tovar;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FlowersRepository extends JpaRepository<Flowers,Long > {
    List<Flowers> findByTitle(String title);
}
