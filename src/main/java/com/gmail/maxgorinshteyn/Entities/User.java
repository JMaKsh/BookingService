package com.gmail.maxgorinshteyn.Entities;

import com.gmail.maxgorinshteyn.Entities.enums.UserRole;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "user")
public class User {
    private long id;
    private String name;
    private String login;
    private String password;
    private UserRole role;
    private String email;
    private List<Ticket> tickets;

    public User() {
    }

    public User(String name, String login, String password, UserRole role, String email) {
        this.name = name;
        this.login = login;
        this.password = password;
        this.role = role;
        this.email = email;

    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "login")
    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Enumerated(EnumType.STRING)
    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }
}
