package com.gmail.maxgorinshteyn.Entities;

import javax.persistence.*;
import java.util.List;


@Entity
@Table(name = "departures")
public class Departure {
    private int id;
    private String fullname;
    private String shortname;
    private List<Schedule> schedules;

    public Departure() {
    }

    public Departure(String fullname, String shortname, List<Schedule> schedules) {
        this.fullname = fullname;
        this.shortname = shortname;
        this.schedules = schedules;
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

    @Column(name = "fullname")
    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    @Column(name = "shortname")
    public String getShortname() {
        return shortname;
    }

    public void setShortname(String shortname) {
        this.shortname = shortname;
    }


    @OneToMany(mappedBy = "departure", cascade = CascadeType.ALL)
    public List<Schedule> getSchedules() {
        return schedules;
    }

    public void setSchedules(List<Schedule> schedules) {
        this.schedules = schedules;
    }
}
