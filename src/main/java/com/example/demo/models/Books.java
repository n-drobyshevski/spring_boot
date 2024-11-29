package com.example.demo.models;

import com.example.demo.models.Image;
import com.example.demo.models.User;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "books")
@Data
public class Books {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private String author;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(nullable = false)
    private double price;

    private String genre;

    private int stockQuantity;


    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "books")
    private List<Image> images = new ArrayList<>();

    private Long previewImageID;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn
    private User user;

    //private LocalDateTime dateOfCreated;
    //@PrePersist
    //private void init(){
    //    dateOfCreated=LocalDateTime.now();
    //}
    public void addImageToBooks(Image image) {
        image.setBooks(this);
        images.add(image);
    }

}