package com.example.demo.models;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import java.util.Set;
import com.example.demo.models.Books; 

import javax.persistence.*;
import lombok.Data;

@Entity
@Table(name = "compilation")
@Data
public class Compilation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    
    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String description;

    @ManyToMany
    @JoinTable(
        name = "compilation_books",
        joinColumns = @JoinColumn(name = "compilation_id"),
        inverseJoinColumns = @JoinColumn(name = "book_id")
    )
    private Set<Books> books;
}