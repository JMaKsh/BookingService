package com.gmail.maxgorinshteyn.DAOImpl;


import com.gmail.maxgorinshteyn.DAO.UserDAO;
import com.gmail.maxgorinshteyn.Entities.User;
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
    public User findUserByLogin(String login) {
        Query query;
        query = entityManager.createQuery("SELECT user FROM User user where user.login = :login", User.class);
        query.setParameter("login", login);
        User user = (User) query.getSingleResult();
        return user;
    }

    @Override
    public List<User> allUserList() {
        Query query;
        query = entityManager.createQuery("SELECT user FROM User user", User.class);
        List<User> userList = query.getResultList();
        return userList;
    }

    @Override
    public void addUserToDB(User user) {
        entityManager.merge(user);
    }
}

