package com.gmail.maxgorinshteyn.Service;

import com.gmail.maxgorinshteyn.DAO.*;
import com.gmail.maxgorinshteyn.Entities.Schedule;
import com.gmail.maxgorinshteyn.Entities.Ticket;
import com.gmail.maxgorinshteyn.Entities.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@org.springframework.stereotype.Service
public class Service {
    @Autowired
    private ScheduleDAO scheduleDAO;

    @Autowired
    private TicketDAO ticketDAO;

    @Autowired
    private DepartureDAO departureDAO;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private RateDAO rateDAO;

    @Transactional(readOnly = true)
    public List<Ticket> listTickets() {
        return ticketDAO.ticketList();
    }

    @Transactional(readOnly = true)
    public List<Schedule> list(String from, String to, LocalDate date) {
        return scheduleDAO.list(from, to, date);
    }

    @Transactional(readOnly = true)
    public Schedule findScheduleById(long id) {
        return scheduleDAO.findScheduleById(id);
    }


    @Transactional(readOnly = true)
    public List<String> listDepartureFullNames() {
        return departureDAO.departureFullNames();
    }

    @Transactional(readOnly = true)
    public List<Client> listAllUsers() {
        return userDAO.allUserList();
    }

    @Transactional
    public void addNewUser(Client user) {
        userDAO.addUserToDB(user);
    }

    @Transactional
    public void addNewTicket(Ticket ticket) {
        ticketDAO.addTicket(ticket);
    }

    @Transactional(readOnly = true)
    public List<Ticket> listTicketForUser(Client user, boolean status) {
        return ticketDAO.ticketListForUser(user, status);
    }

    @Transactional
    public void deleteTicket(long[] ids) {
        ticketDAO.delete(ids);
    }

    @Transactional
    public void addNewRate() {
        rateDAO.init();
    }

    @Transactional
    public void submitTicket(long[] ids) {
        ticketDAO.submitTicket(ids);
    }



}
