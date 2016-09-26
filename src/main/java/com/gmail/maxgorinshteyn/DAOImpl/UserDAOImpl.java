package com.gmail.maxgorinshteyn.DAOImpl;


import com.gmail.maxgorinshteyn.DAO.UserDAO;
import com.gmail.maxgorinshteyn.Entities.Client;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Client findUserByLogin(String login) {
        Query query;
        query = entityManager.createQuery("SELECT user FROM Client user where user.login = :login", Client.class);
        query.setParameter("login", login);
        Client user = (Client) query.getSingleResult();
        return user;
    }

    @Override
    public List<Client> allUserList() {
        Query query;
        query = entityManager.createQuery("SELECT user FROM Client user", Client.class);
        List<Client> userList = query.getResultList();
        return userList;
    }

    @Override
    public void addUserToDB(Client user) {
        entityManager.merge(user);
    }
}

