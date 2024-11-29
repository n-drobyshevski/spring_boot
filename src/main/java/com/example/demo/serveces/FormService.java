package com.example.demo.serveces;

import com.example.demo.models.Cart;
import com.example.demo.models.Form;
import com.example.demo.models.User;
import com.example.demo.models.enums.Role;
import com.example.demo.repositories.CartRepository;
import com.example.demo.repositories.FormRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.time.LocalDate;
import javax.transaction.Transactional;


@Service
@Slf4j
@RequiredArgsConstructor
public class FormService{

    public final FormRepository formRepository;

    public boolean addToFormApp(Form form) {
        if (formRepository.findAllByName(form.getName()) != null) {
            return false;
        }
        formRepository.save(form);
        return true;
    }

    public List<Form> getAll(){
        return formRepository.findAll();
    }


}
