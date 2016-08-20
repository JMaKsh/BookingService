package com.gmail.maxgorinshteyn.Service;

import com.gmail.maxgorinshteyn.DAO.UserDAO;
import com.gmail.maxgorinshteyn.Entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

@Autowired
    UserDAO userDAO;

    @Override
    public User getUserByLogin(String login) {
        return userDAO.findUserByLogin(login);
    }
}
