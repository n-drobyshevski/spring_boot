package com.example.demo.serveces;

import com.example.demo.models.Flowers;
import com.example.demo.models.Image;
import com.example.demo.models.Tovar;
import com.example.demo.models.User;
import com.example.demo.repositories.FlowersRepository;
import com.example.demo.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class FlowersService {

    public final FlowersRepository flowersRepository;
    private final UserRepository userRepository;
    public List<Flowers> listFlowers(String title){
        if(title != null) return flowersRepository.findByTitle(title);
        return flowersRepository.findAll();
    }
    public List<Flowers> list(){
        return flowersRepository.findAll();
    }

    public void saveFlowers(Principal principal, Flowers flowers, MultipartFile file1) throws IOException {
        flowers.setUser(getUserByPrincipal(principal));
        Image image1;
        if (file1.getSize() != 0) {
            image1=toImageEntity(file1);
            image1.setPreviewImage(true);
            flowers.addImageToFlowers(image1);
        }

        log.info("Saving new Product.Title:{}", flowers.getTitle(),flowers.getUser().getEmail());
        Flowers flowersFromDb=flowersRepository.save(flowers);
        flowersFromDb.setPreviewImageID(flowersFromDb.getImages().get(0).getID());
        flowersRepository.save(flowers);
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
    public void deleteFlowers(Long ID){
        flowersRepository.deleteById(ID);
    }
    public Flowers getFlowersByID(Long ID){
        return flowersRepository.findById(ID).orElse(null);
    }
    public List<Flowers> getAllFlowers() {
            // Получите все цветки из репозитория или другого источника данных
            return flowersRepository.findAll();
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

    public List<Flowers> getFlowersByTitle(String searchQuery) {
        return flowersRepository.findByTitle(searchQuery);
    }
}
