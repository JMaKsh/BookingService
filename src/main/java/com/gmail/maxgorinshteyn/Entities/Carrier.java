package com.gmail.maxgorinshteyn.Entities;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "carriers")
public class Carrier {

    private long id;
    private String fullname;
    private String shortname;
    private Vehicle vehicle;
    private Set<Schedule> schedule;

    public Carrier() {
    }

    public Carrier(String fullname, String shortname) {
        this.fullname = fullname;
        this.shortname = shortname;
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

    @ManyToOne
    @JoinColumn(name = "vehicle_id")
    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    @OneToMany(mappedBy = "carrier", cascade = CascadeType.ALL)
    public Set<Schedule> getSchedule() {
        return schedule;
    }

    public void setSchedule(Set<Schedule> schedule) {
        this.schedule = schedule;
    }
}
