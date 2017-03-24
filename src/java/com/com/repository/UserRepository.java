package com.com.repository;

import com.com.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by ruslan on 10.03.17.
 */
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
