package com.example.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.www.model.EmployeeModel;
import com.example.www.repository.EmployeeRepository;

@Service
public class EmployeeService {

    @Autowired
    EmployeeRepository repository;

    public void saveData(EmployeeModel model) {
        repository.save(model);
    }

    public List<EmployeeModel> getAllData() {
        return repository.findAll();
    }

    public void deleteData(int id) {
        repository.deleteById(id);
    }

    public void updateData(EmployeeModel model) {
        repository.save(model);
    }
    public EmployeeModel findById(int id) {
        return repository.findById(id).orElse(null);
    }
    public List<EmployeeModel> getAllEmployees() {
        return repository.findAll();
    }
    public EmployeeModel findByName(String name)
    {
        return repository.findByName(name);
    }
    
}