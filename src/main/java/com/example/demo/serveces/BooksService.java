package com.example.demo.serveces;

import com.example.demo.models.Books;
import com.example.demo.models.Compilation;
import com.example.demo.models.Image;
import com.example.demo.models.Tovar;
import com.example.demo.models.User;
import com.example.demo.repositories.BooksRepository;
import com.example.demo.repositories.ImageRepository;
import com.example.demo.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.awt.print.Book;
import java.io.*;
import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Service
@Slf4j
@RequiredArgsConstructor
public class BooksService {

    public final BooksRepository booksRepository;
    private final UserRepository userRepository;
    private final ImageRepository imageRepository;

    public List<Books> listBooks(String title) {
        List<Books> books;
        if (title != null && !title.isEmpty()) {
            books = booksRepository.findByTitleContainingIgnoreCase(title);
        } else {
            books = booksRepository.findAll();
        }
        log.info("Found {} books with title containing '{}'", books.size(), title);
        return books;
    }

    public List<Books> list() {
        return booksRepository.findAll();
    }

    public void saveBooks(Principal principal, Books books, MultipartFile file1) throws IOException {
        books.setUser(getUserByPrincipal(principal));
        Image image1;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            books.addImageToBooks(image1);
        }

        // Ensure all required fields are set
        if (books.getTitle() == null || books.getAuthor() == null || books.getPrice() == 0) {
            throw new IllegalArgumentException("Title, Author, and Price are required fields.");
        }

        log.info("Saving new Product. Title: {}, User: {}", books.getTitle(), books.getUser().getEmail());
        Books booksFromDb = booksRepository.save(books);
        if (!booksFromDb.getImages().isEmpty()) {
            booksFromDb.setPreviewImageID(booksFromDb.getImages().get(0).getId());
        }
        booksRepository.save(booksFromDb);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null)
            return new User();
        User user = userRepository.findByEmail(principal.getName());
        writeToFile(user.getId().toString());
        return user;

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

    public void editBooks(Long id, Books updatedBooks, MultipartFile file1, Principal principal) throws IOException {
        Books existingBook = booksRepository.findById(id).orElseThrow(() -> new RuntimeException("Book not found"));
        existingBook.setTitle(updatedBooks.getTitle());
        existingBook.setAuthor(updatedBooks.getAuthor());
        existingBook.setGenre(updatedBooks.getGenre());
        existingBook.setDescription(updatedBooks.getDescription());
        existingBook.setPrice(updatedBooks.getPrice());

        if (file1 != null && !file1.isEmpty() && file1.getSize() != 0) {
             // Delete existing images
            List<Image> existingImages = existingBook.getImages();
            for (Image image : existingImages) {
                imageRepository.delete(image);
            }
            existingBook.getImages().clear();
            // Add new image
            Image newImage = new Image();
            newImage.setName(file1.getOriginalFilename());
            newImage.setOriginalFileName(file1.getOriginalFilename());
            newImage.setSize(file1.getSize());
            newImage.setContentType(file1.getContentType());
            newImage.setBytes(file1.getBytes());
            newImage.setBook(existingBook);
            imageRepository.save(newImage);
            existingBook.setPreviewImageID(newImage.getId());
        }

        saveBooks(principal, existingBook, file1);
    }

    public void deleteBooks(Long ID) {
        booksRepository.deleteById(ID);
    }

    public Books getBooksByID(Long ID) {
        return booksRepository.findById(ID).orElse(null);
    }

    public List<Books> findAllById(List<Long> bookIds) {

        return booksRepository.findAllById(bookIds);

    }

    public List<Books> getAllBooks() {
        // Получите все цветки из репозитория или другого источника данных
        return booksRepository.findAll();
    }

    public void writeToFile(String ID) {
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter("file.txt", false));
            writer.write(ID);
            writer.close();
        } catch (IOException e) {
            System.out.println("An error occurred while writing to the file: " + e.getMessage());
        }
    }

    public int read() {
        try {
            BufferedReader reader = new BufferedReader(new FileReader("file.txt"));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
                return Integer.valueOf(line);
            }
            reader.close();
        } catch (IOException e) {
            System.out.println("An error occurred while reading the file.");
            e.printStackTrace();

        }
        return 0;
    }

    public List<Books> getBooksByTitle(String searchQuery) {
        return booksRepository.findByTitle(searchQuery);
    }

    // @Autowired
    // private BooksRepository booksRepository;
    //
    // public List<Book> getAllBooks() {
    // return booksRepository.findAll();
    // }
    //
    // public Optional<Book> getBookById(Long id) {
    // return booksRepository.findById(id);
    // }

    public List<Books> getBooksByGenre(String genre) {
        return booksRepository.findByGenre(genre);
    }

}
