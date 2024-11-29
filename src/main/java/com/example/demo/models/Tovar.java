package com.example.demo.models;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name ="products" )
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tovar {
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
    @Column(name="number")
    private int number;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,mappedBy = "tovar")

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
    public void addImageToTovar(Image image){
        image.setTovar(this);
        images.add(image);
    }
}