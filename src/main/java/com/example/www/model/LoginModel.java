package com.example.www.model;

import jakarta.persistence.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Collections;

@Entity
public class LoginModel implements UserDetails {

    @Id
    @GeneratedValue
    private Long id;

    private String username;
    private String password;
    
    // Add role field for RBAC (e.g. ROLE_USER, ROLE_ADMIN)
    private String role = "ROLE_USER";

    // ✅ getters/setters
    public Long getId() { return id; }   public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    // 🔐 required methods
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        String safeRole = (this.role != null) ? this.role : "ROLE_USER";
        return java.util.Collections.singletonList(new org.springframework.security.core.authority.SimpleGrantedAuthority(safeRole));
    }

    @Override public boolean isAccountNonExpired() { return true; }
    @Override public boolean isAccountNonLocked() { return true; }
    @Override public boolean isCredentialsNonExpired() { return true; }
    @Override public boolean isEnabled() { return true; }
}