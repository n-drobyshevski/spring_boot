package com.example.demo.models;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import javax.persistence.*;
@Setter
@Getter
@Entity
@Table(name ="form")
@Data
@NoArgsConstructor
public class Form{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private Long id;
    @Column(name="name")
    private String name;
    @Column(name="surname")
    private String surname;
    @Column(name="phone_number")
    private String phone_number;
    @Column(name="adress")
    private String adress;
    @Column(name="user_id")
    private int user_id;

    public Form(Long id, String name, String surname, String phone_number, String adress, int user_id) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.phone_number = phone_number;
        this.adress = adress;
        this.user_id = user_id;
    }
}

