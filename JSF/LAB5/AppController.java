package com.example.demo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class AppController {

    @Autowired
    private MobileManager manager;

    // Get all mobiles
    @GetMapping("/mobile")
    public List<Mobile> listAllMobile() {
        return manager.getAllMobile();
    }

    // Get one mobile (404 if not found)
    @GetMapping("/mobile/{id}")
    public ResponseEntity<Mobile> getMobile(@PathVariable Long id) {
        if (manager.exists(id)) {
            return new ResponseEntity<>(manager.getMobileById(id), HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    // Add a mobile
    @PostMapping("/mobile")
    public void saveMobile(@RequestBody Mobile mobile) {
        manager.saveMobile(mobile);
    }

    // Update a mobile
    @PutMapping("/mobile")
    public void updateMobile(@RequestBody Mobile mobile) {
        manager.saveMobile(mobile);
    }

    // Delete a mobile (404 if not found)
    @DeleteMapping("/mobile/{id}")
    public ResponseEntity<Mobile> deleteMobile(@PathVariable Long id) {
        if (manager.exists(id)) {
            manager.deleteMobile(id);
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
}