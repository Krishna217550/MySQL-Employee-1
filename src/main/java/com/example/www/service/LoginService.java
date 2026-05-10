package com.example.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.www.model.LoginModel;
import com.example.www.repository.LoginRepository;

@Service
public class LoginService {

    @Autowired
    LoginRepository repository;


    @Autowired
    private BCryptPasswordEncoder encoder;

    public void save(LoginModel model) {
        if (model.getRole() == null || model.getRole().trim().isEmpty()) {
            model.setRole("ROLE_USER");
        }
        model.setPassword(encoder.encode(model.getPassword())); // 🔐 encrypt here
        repository.save(model);
    }
}