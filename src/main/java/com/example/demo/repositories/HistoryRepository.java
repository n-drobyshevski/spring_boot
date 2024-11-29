package com.example.demo.repositories;

import com.example.demo.models.Cart;
import com.example.demo.models.History;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface HistoryRepository extends JpaRepository<History,Long> {
    @Query(value = "SELECT * FROM history WHERE user_id = ?; ", nativeQuery=true)
    List<History> findAllByUser_id(int ID);


}
