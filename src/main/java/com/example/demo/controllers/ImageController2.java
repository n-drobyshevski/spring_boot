package com.example.demo.controllers;

import com.example.demo.models.Image;
import com.example.demo.repositories.ImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayInputStream;

@RestController
@RequiredArgsConstructor
public class ImageController2 {
    private final ImageRepository imageRepository;
    @GetMapping("/images/{ID}")
    private ResponseEntity<?> getImageByID(@PathVariable Long ID){
        Image image=imageRepository.findById(ID).orElse(null);
        return ResponseEntity.ok()
                .header("img", image.getOriginalFileName())
                .contentType(MediaType.valueOf(image.getContentType()))
                .contentLength(image.getSize())
                .body(new InputStreamResource(new ByteArrayInputStream(image.getBytes())));
    }
}
