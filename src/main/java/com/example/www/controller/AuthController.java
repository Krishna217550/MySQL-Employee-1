package com.example.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.www.model.LoginModel;
import com.example.www.service.LoginService;
import com.example.www.security.JwtUtil;

@Controller
@RequestMapping("/student")
public class AuthController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private JwtUtil jwtUtil;

    // 🔹 Load Login Page
    @GetMapping("/login")
    public String loginPage() {
        return "Login";
    }

    // 🔹 Load Register Page
    @GetMapping("/register")
    public String registerPage() {
        return "Register";
    }
    // 🔹 REGISTER (save user)
    @PostMapping("/register")
    public String register(LoginModel model) {
        loginService.save(model);
        return "Login";
    }
}