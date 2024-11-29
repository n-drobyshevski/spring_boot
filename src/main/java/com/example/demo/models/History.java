package com.example.demo.models;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Setter
@Getter
@Entity
@Table(name ="history" )
@Data
@NoArgsConstructor
public class History {
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

    public History(Long id, String nameproduct, int cost, String image, int user_id) {
        this.id = id;
        this.nameproduct = nameproduct;
        this.cost = cost;
        this.image = image;
        this.user_id = user_id;
    }
}
