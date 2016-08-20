package com.gmail.maxgorinshteyn.Entities;


import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "arrivals")
public class Arrival {
    private long id;
    private String fullName;
    private String shortName;
    private List<Schedule> schedules;

    public Arrival() {
    }

    public Arrival(String fullName, String shortName) {
        this.fullName = fullName;
        this.shortName = shortName;
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

    @Column(name = "fullnname")
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullname) {
        this.fullName = fullname;
    }

    @Column(name = "shortnname")
    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortname) {
        this.shortName = shortname;
    }

    @OneToMany(mappedBy = "arrival", cascade = CascadeType.ALL)
    public List<Schedule> getSchedules() {
        return schedules;
    }

    public void setSchedules(List<Schedule> schedules) {
        this.schedules = schedules;
    }
}
