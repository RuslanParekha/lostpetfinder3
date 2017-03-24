package com.com.services;

/**
 * Created by ruslan on 10.03.17.
 */
public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
