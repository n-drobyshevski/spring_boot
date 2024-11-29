package com.example.demo.models;


import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Setter
@Getter
@Entity
@Table(name ="orders" )
@Data
@NoArgsConstructor
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private Long id;
    @Column(name="customerName")
    private String customerName;
    @Column(name="address")
    private String address;
    @Column(name="paymentMethod")
    private String paymentMethod;
    @Column(name="email")
    private String email;
    @Column(name="status")
    private String status = "В обработке"; // Статус заказа по умолчанию
    @Column(name="bookTitles")
    private String bookTitles;



    public Order(Long id, String customerName, String address, String paymentMethod, String email, String status, String bookTitles) {
        this.id = id;
        this.customerName = customerName;
        this.address = address;
        this.paymentMethod = paymentMethod;
        this.email = email;
        this.status = status;
        this.bookTitles = bookTitles;
    }
}
