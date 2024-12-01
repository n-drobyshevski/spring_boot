package com.example.demo.serveces;

import com.example.demo.models.Books;
import com.example.demo.models.Compilation;
import com.example.demo.models.Image;
import com.example.demo.models.User;
import com.example.demo.repositories.CompilationRepository;
import com.example.demo.repositories.UserRepository;
import com.example.demo.repositories.ImageRepository;
import com.example.demo.repositories.BooksRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.ArrayList;

import java.io.*;
@Service
@Slf4j
@RequiredArgsConstructor
public class CompilationService {
    private final CompilationRepository compilationRepository;
    private final ImageRepository imageRepository;
    private final BooksRepository booksRepository;

    public List<Compilation> getAllCompilations() {
        return compilationRepository.findAll();
    }

    public Compilation getCompilationById(Long ID) {
        return compilationRepository.findById(ID).orElse(null);
    }

    public void saveCompilation(Principal principal, Compilation compilation, MultipartFile file1, List<Long> bookIds)
            throws IOException {
        Image image1;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            compilation.addImageToCompilation(image1);
        }

        List<Books> books = booksRepository.findAllById(bookIds);
        compilation.setBooks(books);

        Compilation compilationFromDB = compilationRepository.save(compilation);
        compilationFromDB.setPreviewImageID(new ArrayList<>(compilationFromDB.getImages()).get(0).getId());
        compilationRepository.save(compilation);
    }

    public void editCompilation(Long ID, MultipartFile file1, Compilation compilation, Principal principal)
            throws IOException {
        Compilation existingCompilation = getCompilationById(ID);
        if (existingCompilation == null) {
            throw new RuntimeException("compilation not found with ID: " + ID);
        }
        existingCompilation.setName(compilation.getName());
        existingCompilation.setDescription(compilation.getDescription());
        // Handle file upload if a new file is provided
        if (!file1.isEmpty()) {
            Image newImage = new Image();
            newImage.setName(file1.getOriginalFilename());
            newImage.setOriginalFileName(file1.getOriginalFilename());
            newImage.setSize(file1.getSize());
            newImage.setContentType(file1.getContentType());
            newImage.setBytes(file1.getBytes());
            newImage.setCompilation(existingCompilation);
            imageRepository.save(newImage);
            existingCompilation.setPreviewImageID(newImage.getId());
        }
        saveCompilation(principal, existingCompilation, file1, new ArrayList<>());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }
    public Compilation editCompilation(Long id, String name, String description, Long coverImageId) {
    Compilation compilation = getCompilationById(id);
    if (compilation != null) {
        compilation.setName(name);
        compilation.setDescription(description);
        compilation.setPreviewImageID(coverImageId); 
        return compilationRepository.save(compilation);
    }
    return null;
}

    public void deleteCompilation(Long id) {
        compilationRepository.deleteById(id);
    }
    
    public void deleteCompilationById(Long id) {
        compilationRepository.deleteById(id);
    }
}