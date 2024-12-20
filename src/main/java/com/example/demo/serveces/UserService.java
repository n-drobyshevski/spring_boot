package com.example.demo.serveces;

import com.example.demo.models.User;
import com.example.demo.models.enums.Role;
import com.example.demo.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.security.Principal;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public boolean createUser(User user) {
        String userEmail = user.getEmail();
        if (userRepository.findByEmail(userEmail) != null)
            return false;
        user.setActive(true);
        user.getRoles().add(Role.ROLE_USER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        log.info("Saving new User with email: {}", userEmail);
        userRepository.save(user);
        return true;
    }

    public List<User> list() {
        return userRepository.findAll();
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            if (user.isActive()) {
                user.setActive(false);
                log.info("Ban user with id = {}; email: {}", user.getId(), user.getEmail());
            } else {
                user.setActive(true);
                log.info("Unban user with id = {}; email: {}", user.getId(), user.getEmail());
            }
        }
        userRepository.save(user);
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        // Extract the new role from the form
        String newRole = form.get("role");

        // Check if the new role is different from the current role
        if (user.getRoles().stream().noneMatch(role -> role.name().equals(newRole))) {
            // Clear existing roles and set the new role
            user.getRoles().clear();
            user.getRoles().add(Role.valueOf(newRole));
            userRepository.save(user);
        }
    }

    public String getUserRole(Principal principal) {
        if (principal == null) {
            log.warn("Principal is null, user is not authenticated");
            return null;
        }

        String email = principal.getName();
        User user = userRepository.findByEmail(email);

        if (user == null) {
            log.warn("User not found with email: {}", email);
            return null;
        }

        if (user.getRoles().isEmpty()) {
            log.warn("User with email: {} has no roles assigned", email);
            return null;
        }

        String role = user.getRoles().iterator().next().name();
        log.info("User with email: {} has role: {}", email, role);
        return role;
    }

    public User getUserById(Long id) {

        return userRepository.findById(id).orElse(null);

    }

    public Long getUserId(Principal principal) {
        if (principal == null) {
            log.warn("Principal is null, user is not authenticated");
            return null;
        }

        String email = principal.getName();
        User user = userRepository.findByEmail(email);

        if (user == null) {
            log.warn("User not found with email: {}", email);
            return null;
        }

        Long userId = user.getId();
        log.info("User with email: {} has ID: {}", email, userId);
        return userId;
    }

    // public void writeToFile(String id){
    // try {
    // FileWriter writer = new FileWriter("file.txt");
    // writer.write(id);
    // writer.close();
    // } catch (IOException e) {
    // System.out.println("An error occurred while writing to the file.");
    // e.printStackTrace();
    // }
    // }
    // public int read(){
    // try {
    // BufferedReader reader = new BufferedReader(new FileReader("file.txt"));
    // String line;
    // while ((line = reader.readLine()) != null) {
    // System.out.println(line);
    // return Integer.valueOf(line);
    // }
    // reader.close();
    // } catch (IOException e) {
    // System.out.println("An error occurred while reading the file.");
    // e.printStackTrace();
    //
    // }
    // return 0;
    // }
}
