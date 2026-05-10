package com.example.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.www.model.EmployeeModel;
import com.example.www.service.EmployeeService;

@Controller
@RequestMapping("/student")
public class EmployeeSearchController {

    @Autowired
    EmployeeService service;

    @GetMapping("/search")
    public String searchPage() {
        return "Search";
    }

    @PostMapping("/searchById")
    public String searchById(@RequestParam int id, Model model) {

        EmployeeModel obj = service.findById(id);

        if(obj == null)
            model.addAttribute("msg", "Employee not found");
        else
            model.addAttribute("result", obj);

        return "Search";
    }

    @PostMapping("/searchByName")
    public String searchByName(@RequestParam String name, Model model) {

        EmployeeModel obj = service.findByName(name);

        if(obj == null)
            model.addAttribute("msg", "Employee not found");
        else
            model.addAttribute("result", obj);

        return "Search";
    }
}