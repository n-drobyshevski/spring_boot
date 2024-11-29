package com.example.demo.serveces;

import com.example.demo.models.Books;
import com.example.demo.models.Image;
import com.example.demo.models.User;
import com.example.demo.repositories.BooksRepository;
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
    public List<Books> listBooks(String title){
        if(title != null) return booksRepository.findByTitle(title);
        return booksRepository.findAll();
    }
    public List<Books> list(){
        return booksRepository.findAll();
    }

    public void saveBooks(Principal principal, Books books, MultipartFile file1) throws IOException {
        books.setUser(getUserByPrincipal(principal));
        Image image1;
        if (file1.getSize() != 0) {
            image1=toImageEntity(file1);
            image1.setPreviewImage(true);
            books.addImageToBooks(image1);
        }

        log.info("Saving new Product.Title:{}", books.getTitle(),books.getUser().getEmail());
        Books booksFromDb=booksRepository.save(books);
        booksFromDb.setPreviewImageID(booksFromDb.getImages().get(0).getID());
        booksRepository.save(books);
    }

    public User getUserByPrincipal(Principal principal) {
        if(principal==null)return new User();
        User user=userRepository.findByEmail(principal.getName());
        writeToFile(user.getId().toString());
        return user;

    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image =new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }
    public void deleteBooks(Long ID){
        booksRepository.deleteById(ID);
    }
    public Books getBooksByID(Long ID){
        return booksRepository.findById(ID).orElse(null);
    }
    public List<Books> getAllBooks() {
        // Получите все цветки из репозитория или другого источника данных
        return booksRepository.findAll();
    }


    public  void writeToFile(String ID){
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter("file.txt", false));
            writer.write(ID);
            writer.close();
        } catch (IOException e) {
            System.out.println("An error occurred while writing to the file: " + e.getMessage());
        }
    }
    public int read(){
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

//    @Autowired
//    private BooksRepository booksRepository;
//
//    public List<Book> getAllBooks() {
//        return booksRepository.findAll();
//    }
//
//    public Optional<Book> getBookById(Long id) {
//        return booksRepository.findById(id);
//    }





    public List<Books> getBooksByGenre(String genre) {
        return booksRepository.findByGenre(genre);
    }



}
