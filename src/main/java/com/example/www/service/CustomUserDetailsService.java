package com.example.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import com.example.www.model.LoginModel;
import com.example.www.repository.LoginRepository;

import java.util.Collections;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private LoginRepository repo;

    @Override
    public UserDetails loadUserByUsername(String username) {
        LoginModel user = repo.findFirstByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        String role = user.getRole() != null ? user.getRole() : "ROLE_USER";
        return new org.springframework.security.core.userdetails.User(
                user.getUsername(),
                user.getPassword(),
                Collections.singletonList(new SimpleGrantedAuthority(role))
        );
    }
}