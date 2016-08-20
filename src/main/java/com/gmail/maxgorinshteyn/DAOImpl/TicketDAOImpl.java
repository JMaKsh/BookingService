package com.gmail.maxgorinshteyn.DAOImpl;

import com.gmail.maxgorinshteyn.DAO.TicketDAO;
import com.gmail.maxgorinshteyn.Entities.Ticket;
import com.gmail.maxgorinshteyn.Entities.User;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;


@Repository
public class TicketDAOImpl implements TicketDAO {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Ticket> ticketList() {
        Query query;
        query = entityManager.createQuery("SELECT t FROM Ticket t", Ticket.class);
        return (List<Ticket>) query.getResultList();
    }

    @Override
    public void addTicket(Ticket ticket) {
        entityManager.merge(ticket);
    }

    @Override
    public void delete(long[] ticketIds) {
        Ticket ticketToDelete;
        for (long id : ticketIds) {
            ticketToDelete = entityManager.getReference(Ticket.class, id);
            entityManager.remove(ticketToDelete);
        }
    }

    @Override
    public void submitTicket(long[] ticketIds) {
        Ticket ticketToSubmit;
        for (long id : ticketIds) {
            ticketToSubmit = entityManager.getReference(Ticket.class, id);
            ticketToSubmit.setStatus(true);
            entityManager.persist(ticketToSubmit);
        }
    }

    @Override
    public List<Ticket> ticketListForUser(User user, boolean status) {
        long userId = user.getId();
        Query query;
        query = entityManager.createQuery("SELECT t FROM Ticket t where t.user.id = :userId AND t.status= :status", Ticket.class);
        query.setParameter("userId",userId);
        query.setParameter("status",status);
        return (List<Ticket>) query.getResultList();
    }

}
