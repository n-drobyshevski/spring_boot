package com.example.demo.repositories;

import com.example.demo.models.Books;
import com.example.demo.models.Tovar;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BooksRepository extends JpaRepository<Books,Long > {
    List<Books> findByTitle(String title);


    List<Books> findByGenre(String genre);


}
