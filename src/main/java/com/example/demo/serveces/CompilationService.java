package com.example.demo.serveces;

import com.example.demo.models.Compilation;
import com.example.demo.repositories.CompilationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompilationService {

    @Autowired
    private CompilationRepository compilationRepository;

    public List<Compilation> getAllCompilations() {
        return compilationRepository.findAll();
    }

    public Compilation getCompilationById(Long ID) {
        return compilationRepository.findById(ID).orElse(null);
    }

    public Compilation saveCompilation(Compilation collection) {
        return compilationRepository.save(collection);
    }

    public void deleteCompilation(Long id) {
        compilationRepository.deleteById(id);
    }
    
    public void deleteCompilationById(Long id) {
        compilationRepository.deleteById(id);
    }
}