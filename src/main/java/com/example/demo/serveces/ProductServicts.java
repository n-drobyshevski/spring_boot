package com.example.demo.serveces;

import com.example.demo.models.Image;
import com.example.demo.models.Tovar;
import com.example.demo.models.User;
import com.example.demo.repositories.TovarRepository;
import com.example.demo.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class
ProductServicts {

    public final TovarRepository tovarRepository;
    private final UserRepository userRepository;

    public List<Tovar> listTovar(String title){
        if(title != null) return tovarRepository.findByTitle(title);
        return tovarRepository.findAll();
    }

    public void saveTovar(Principal principal,Tovar product, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        product.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        if (file1.getSize() != 0) {
            image1=toImageEntity(file1);
            image1.setPreviewImage(true);
            product.addImageToTovar(image1);
        }
        if (file2.getSize() != 0) {
            image2=toImageEntity(file2);
            product.addImageToTovar(image2);
        }
        if (file3.getSize() != 0) {
            image3=toImageEntity(file3);
            product.addImageToTovar(image3);
        }
        log.info("Saving new Product.Title:{}", product.getTitle(),product.getUser().getEmail());
        Tovar productFromDb=tovarRepository.save(product);
        productFromDb.setPreviewImageID(productFromDb.getImages().get(0).getID());
        tovarRepository.save(product);
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
    public void deleteTovar(Long ID){
        tovarRepository.deleteById(ID);
    }
    public Tovar getProductByID(Long ID){
      return tovarRepository.findById(ID).orElse(null);
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
}
