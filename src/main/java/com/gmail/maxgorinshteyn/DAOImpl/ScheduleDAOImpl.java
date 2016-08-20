package com.gmail.maxgorinshteyn.DAOImpl;

import com.gmail.maxgorinshteyn.DAO.ScheduleDAO;
import com.gmail.maxgorinshteyn.Entities.Schedule;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.time.LocalDate;
import java.util.List;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {
    @PersistenceContext
    private EntityManager entityManager;


    @Override

    public List<Schedule> list(String from, String to, LocalDate date) {
        Query query;
        query = entityManager.createQuery("SELECT sch FROM Schedule sch where sch.departure.fullname = :from AND sch.arrival.fullName = :to AND sch.date=:date", Schedule.class);
        query.setParameter("from", from);
        query.setParameter("to", to);
        query.setParameter("date", date);
        return (List<Schedule>) query.getResultList();
    }

    @Override
    public Schedule findScheduleById(long id) {
        Query query;
        query = entityManager.createQuery("SELECT sch FROM Schedule sch where sch.id = :id", Schedule.class);
        query.setParameter("id", id);
        return (Schedule) query.getSingleResult();
    }
}
