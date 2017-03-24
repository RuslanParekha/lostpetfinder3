package com.com.services;

import com.com.model.User;

import java.util.List;

/**
 * Created by ruslan on 10.03.17.
 */
public interface UserService  {

    List<User> listUsers();
    void save(User user);
    void remove(long id);

    User findByUsername(String username);
}
