package com.example.demo.models;

import lombok.*;

import javax.persistence.*;

@Setter
@Getter
@Entity
@Table(name = "purchase_history")
@Data
@NoArgsConstructor
public class History {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "user_id")
    private int userId;

    @Column(name = "nameproduct")
    private String nameproduct;

    @Column(name = "cost")
    private int cost;

    @Column(name = "image")
    private String image;

    @Column(name = "customer_name")
    private String customerName;

    @Column(name = "address")
    private String address;

    @Column(name = "payment_method")
    private String paymentMethod;

    @Column(name = "email")
    private String email;

    public History(Long id, String nameproduct, int cost, String image, int userId) {
        this.id = id;
        this.nameproduct = nameproduct;
        this.cost = cost;
        this.image = image;
        this.userId = userId;
    }
    
    public void setUser_id(int user_id) {

        this.userId = user_id;

    }

    public int getUser_id() {

        return userId;

    }

}