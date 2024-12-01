package com.example.demo.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "images")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(exclude = "compilation")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Long ID;
    @Column(name = "name")
    private String name;
    @Column(name = "originalFileName")
    private String originalFileName;
    @Column(name = "size")
    private Long size;
    @Column(name = "contentType")
    private String contentType;
    @Column(name = "isPreviewImage")
    private boolean isPreviewImage;
    @Lob
    @Column(name = "bytes", columnDefinition = "blob")
    private byte[] bytes;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private Tovar tovar;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private Books books;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private Flowers flowers;

    public void setFlowers(Flowers flowers) {
        this.flowers = flowers;
    }
    
    
    @ManyToOne
    @JoinColumn(name = "compilation_id")
    private Compilation compilation;

    public void setCompilation(Compilation compilation) {
        this.compilation = compilation;
    }
    
    public Long getId() {
        return ID;
    }
}
