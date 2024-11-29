package com.example.demo.controllers;

import com.example.demo.models.Books;
import com.example.demo.models.Tovar;
import com.example.demo.repositories.ImageRepository;
import com.example.demo.serveces.BooksService;
import com.example.demo.serveces.BooksService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.awt.print.Book;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class BooksController {
    private final BooksService booksService;
    private final ImageRepository imageRepository;

    @GetMapping("/books")
    public String product(@RequestParam(name = "title",required = false) String title,Principal principal, Model model) {
        model.addAttribute("books",booksService.listBooks(title));
        model.addAttribute("user",booksService.getUserByPrincipal(principal));
        model.addAttribute("flowers", booksService.list());
        model.addAttribute("images", imageRepository.findAll());
        return "books";
    }
    @GetMapping("/getBooks")
    public String searchBooksByTitle(@RequestParam(value = "title", required = false) String searchQuery, Model model) {
        List<Books> searchResults;
        if (searchQuery != null && !searchQuery.isEmpty()) {
            // Выполните поиск цветков по названию
            searchResults = booksService.getBooksByTitle(searchQuery);
        } else {
            // Если поисковый запрос пустой, отобразите все цветки
            searchResults = booksService.getAllBooks();
        }
        model.addAttribute("books", searchResults);
        return "books";









    }
//    @GetMapping("/books/{ID}")
//    public String productInfo(@PathVariable Long ID,Model model){
//        Books books=booksService.getBooksByID(ID);
//        model.addAttribute("books",books);
//        model.addAttribute("image",books.getImages());
//        return"admin";
//    }
    @PostMapping("/books/create")
    public String createBooks(@RequestParam("file1") MultipartFile file1,
            Books books, Principal principal)throws IOException {
        booksService.saveBooks(principal,books,file1);
        return "redirect:/admin";
    }
    @PostMapping("/books/delete/{ID}")
    public String deleteBooks(@PathVariable Long ID){
        booksService.deleteBooks(ID);
        return"redirect:/admin";
    }





















    @GetMapping("/books/{ID}")
    public String getBooksDetails(@PathVariable Long ID, Model model) {
        Books book = booksService.getBooksByID(ID);
        if (book == null) {
            throw new RuntimeException("Book not found with ID: " + ID);
        }
        model.addAttribute("book", book);
        return "book-details"; // Имя HTML-шаблона
    }







    @GetMapping("/getBooksByGenre")
    public String getBooks(@RequestParam(required = false) String genre, Model model) {
        List<Books> books;
        if (genre != null && !genre.isEmpty()) {
            books = booksService.getBooksByGenre(genre);
        } else {
            books = booksService.getAllBooks();
        }
        model.addAttribute("books", books);
        return "books"; // Имя вашего шаблона списка книг
    }
}