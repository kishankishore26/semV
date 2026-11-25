package com.example.demo;

import jakarta.persistence.*;

@Entity
public class Mobile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String model;
    private String osystem;

    public Mobile() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getOsystem() {
        return osystem;
    }

    public void setOsystem(String osystem) {
        this.osystem = osystem;
    }
}
