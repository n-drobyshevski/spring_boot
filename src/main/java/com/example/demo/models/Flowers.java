package com.example.demo.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
@Entity
@Table(name ="flowers" )
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Flowers {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="ID")
    private Long ID;
    @Column(name="title")
    private String title;
    @Column(name="description",columnDefinition = "text")
    private String description;
    @Column(name="price")
    private int price;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy = "flowers")
    private List<Image> images = new ArrayList<>();

    private Long previewImageID;
    @ManyToOne(cascade = CascadeType.REFRESH,fetch =FetchType.LAZY )
    @JoinColumn
    private User user;
    private LocalDateTime dateOfCreated;
    @PrePersist
    private void init(){
        dateOfCreated=LocalDateTime.now();
    }
    public void addImageToFlowers(Image image){
        image.setFlowers(this);
        images.add(image);
    }
}
