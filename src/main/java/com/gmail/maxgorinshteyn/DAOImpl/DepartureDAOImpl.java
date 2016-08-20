package com.gmail.maxgorinshteyn.DAOImpl;

import com.gmail.maxgorinshteyn.DAO.DepartureDAO;
import com.gmail.maxgorinshteyn.Entities.Departure;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

@Repository
public class DepartureDAOImpl implements DepartureDAO {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<String> departureFullNames() {
        Query query;
        List<String> departureFullNames = new ArrayList<>();
        query = entityManager.createQuery("SELECT dep FROM Departure dep", Departure.class);
        List<Departure> departures = (List<Departure>) query.getResultList();
        for(Departure departure:departures)
        departureFullNames.add(departure.getFullname());
        return departureFullNames;
    }
}
