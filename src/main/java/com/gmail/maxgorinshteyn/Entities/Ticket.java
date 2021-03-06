package com.gmail.maxgorinshteyn.Entities;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "ticket")
public class Ticket {
    private long id;
    private Client user;
    private Schedule schedule;
    private LocalDate createdDate;
    private boolean status;

    public Ticket() {
    }

    public Ticket(Client user, Schedule schedule, LocalDate createdDate, boolean status) {
        this.user = user;
        this.schedule = schedule;
        this.createdDate = createdDate;
        this.status = status;
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

    @ManyToOne
    @JoinColumn(name = "user_id")
    public Client getUser() {
        return user;
    }

    public void setUser(Client user) {
        this.user = user;
    }

    @ManyToOne
    @JoinColumn(name = "schedule_id")
    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }

    public LocalDate getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDate createdDate) {
        this.createdDate = createdDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}




