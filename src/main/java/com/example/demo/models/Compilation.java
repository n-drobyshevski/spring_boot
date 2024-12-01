package com.example.demo.models;

import java.util.Set;
import com.example.demo.models.Books;
import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.HashSet;

import javax.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name = "compilation")
@Data
@EqualsAndHashCode(exclude = {"images", "books"})
public class Compilation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    
    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String description;

    @ManyToMany
    @JoinTable(
        name = "compilation_books",
        joinColumns = @JoinColumn(name = "compilation_id"),
        inverseJoinColumns = @JoinColumn(name = "book_id")
    )
    
    private Set<Books> books = new HashSet<>();
    private Long previewImageID;
    
    public Long getPreviewImageID() {

        return previewImageID;

    }

    public void setPreviewImageID(Long previewImageID) {

        this.previewImageID = previewImageID;

    }

    @OneToMany(mappedBy = "compilation", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Image> images = new HashSet<>();

    public void addImageToCompilation(Image image) {
        image.setCompilation(this);
        images.add(image);
    }
}