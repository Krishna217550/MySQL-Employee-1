package com.example.www.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;

import com.example.www.model.EmployeeModel;
import com.example.www.service.EmployeeService;

@Controller
@RequestMapping("/student")
public class EmployeeDataBaseController {

    @Autowired
    EmployeeService service;

    @GetMapping("/")
    public String home() {
        return "index";
    }

    private boolean isUser() {
        org.springframework.security.core.Authentication auth = org.springframework.security.core.context.SecurityContextHolder
                .getContext().getAuthentication();
        return auth != null && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_USER"));
    }

    @GetMapping("/add")
    public String addStudent(Model m) {
        if (isUser()) {
            m.addAttribute("alertMsg", "user have no access to change the data");
            return "index";
        }
        m.addAttribute("employeeModel", new EmployeeModel());
        return "addStudent";
    }

    @GetMapping("/delete")
    public String deleteStudent(Model m) {
        if (isUser()) {
            m.addAttribute("alertMsg", "user have no access to change the data");
            return "index";
        }
        return "delete";
    }

    @GetMapping("/update")
    public String updateStudent(Model m) {
        if (isUser()) {
            m.addAttribute("alertMsg", "user have no access to change the data");
            return "index";
        }
        return "UpdateStudent";
    }

    @PostMapping("/save")
    public String save(@Valid @ModelAttribute("employeeModel") EmployeeModel model,
            BindingResult result,
            Model m) {

        if (isUser()) {
            m.addAttribute("alertMsg", "user have no access to change the data");
            return "index";
        }

        if (result.hasErrors()) {
            return "addStudent";
        }

        service.saveData(model);
        m.addAttribute("msg", "Successfully Added");
        return "addStudent";
    }

    // ✅ UPDATE with validation
    @PostMapping("/update")
    public String update(@Valid @ModelAttribute("employeeModel") EmployeeModel model,
            BindingResult result,
            Model m) {

        if (isUser()) {
            m.addAttribute("alertMsg", "user have no access to change the data");
            return "index";
        }

        if (result.hasErrors()) {
            return "UpdateStudent";
        }

        service.updateData(model);
        m.addAttribute("msg", "Successfully Updated");
        return "UpdateStudent";
    }

    // DELETE (no validation needed except id check)
    @PostMapping("/delete")
    public String delete(@RequestParam int id, Model m) {
        if (isUser()) {
            m.addAttribute("alertMsg", "user have no access to change the data");
            return "index";
        }
        try {
            service.deleteData(id);
            m.addAttribute("msg", "Successfully Deleted");
        } catch (Exception e) {
            m.addAttribute("msg", "Invalid ID");
        }
        return "delete";
    }

    @GetMapping("/viewAll")
    public String viewAll(Model m) {

        List<EmployeeModel> list = service.getAllEmployees();

        // Always send list (even if empty)
        if (list == null) {
            list = new ArrayList<>();
        }

        m.addAttribute("employees", list);

        if (list.isEmpty()) {
            m.addAttribute("msg", "No Employee Records Found");
        }

        return "viewEmployees";
    }
}