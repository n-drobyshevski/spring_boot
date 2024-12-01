package com.example.demo.repositories;

import com.example.demo.models.Compilation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface CompilationRepository extends JpaRepository<Compilation, Long> {
    Optional<Compilation> findById(Long Id);
}