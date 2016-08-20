package com.gmail.maxgorinshteyn.DAO;

import com.gmail.maxgorinshteyn.Entities.Ticket;
import com.gmail.maxgorinshteyn.Entities.User;

import java.util.List;

public interface TicketDAO {
     List<Ticket> ticketList();
     void addTicket(Ticket ticket);
     void delete(long[] ticketIds);
     void submitTicket(long[] ticketIds);
     List<Ticket> ticketListForUser(User user,boolean status);

}

