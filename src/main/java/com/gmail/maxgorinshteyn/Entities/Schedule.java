package com.gmail.maxgorinshteyn.Entities;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;


@Entity
@Table(name = "schedule")
public class Schedule {
    private long id;
    private Departure departure;
    private Arrival arrival;
    private double price;
    private Carrier carrier;
    private LocalDate date;
    private LocalTime time;
    private int distance;
    private LocalTime duration;
    private List<Ticket> ticketList;



    public Schedule() {
    }

    public Schedule(Departure departure, Arrival arrival, double price, Carrier carrier, LocalDate date, LocalTime time, int distance, LocalTime duration, List<Ticket> ticketList) {
        this.departure = departure;
        this.arrival = arrival;
        this.price = price;
        this.carrier = carrier;
        this.date = date;
        this.time = time;
        this.distance = distance;
        this.duration = duration;
        this.ticketList = ticketList;
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
    @JoinColumn(name = "departure_id")
    public Departure getDeparture() {
        return departure;
    }

    public void setDeparture(Departure departure) {
        this.departure = departure;
    }

    @ManyToOne
    @JoinColumn(name = "arrival_id")
    public Arrival getArrival() {
        return arrival;
    }

    public void setArrival(Arrival arrival) {
        this.arrival = arrival;
    }

    @Column(name = "price")
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @ManyToOne
    @JoinColumn(name = "carrier_id")
    public Carrier getCarrier() {
        return carrier;
    }

    public void setCarrier(Carrier carrier) {
        this.carrier = carrier;
    }

    @Column(name = "date")
    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    @Column(name = "time")
    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    @Column(name = "distance")
    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }

    @Column(name = "duration")
    public LocalTime getDuration() {
        return duration;
    }

    public void setDuration(LocalTime duration) {
        this.duration = duration;
    }

    @OneToMany(mappedBy = "schedule", cascade = CascadeType.ALL)
    public List<Ticket> getTicketList() {
        return ticketList;
    }

    public void setTicketList(List<Ticket> ticketList) {
        this.ticketList = ticketList;
    }
}
