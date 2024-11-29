package com.example.demo.models;

import lombok.*;

import javax.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;
@Setter
@Getter
@Entity
@Table(name ="cart" )
@Data
@NoArgsConstructor
public class Cart {
        @Id
        @GeneratedValue(strategy = GenerationType.AUTO)
        @Column(name="id")
        private Long id;
        @Column(name="nameproduct")
        private String nameproduct;
        @Column(name="cost")
        private int cost;
        @Column(name="image")
        private String image;
        @Column(name="user_id")
        private int user_id;

    public Cart(Long id, String nameproduct, int cost, String image, int user_id) {
        this.id = id;
        this.nameproduct = nameproduct;
        this.cost = cost;
        this.image = image;
        this.user_id = user_id;
    }
}
