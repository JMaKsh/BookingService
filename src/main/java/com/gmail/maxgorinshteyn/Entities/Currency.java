package com.gmail.maxgorinshteyn.Entities;

import javax.persistence.*;

@Entity
@Table(name = "rate")
public class Currency {
    private int id;
    private String name;
    private String code;
    private double rate;

    public Currency() {
    }

    public Currency(String name, String code, double rate) {
        this.name = name;
        this.code = code;
        this.rate = rate;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "code")
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Column(name = "rate")
    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }
}
