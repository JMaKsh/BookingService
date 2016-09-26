package com.gmail.maxgorinshteyn.Service;

import com.gmail.maxgorinshteyn.DAO.UserDAO;
import com.gmail.maxgorinshteyn.Entities.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

@Autowired
    UserDAO userDAO;

    @Override
    public Client getUserByLogin(String login) {
        return userDAO.findUserByLogin(login);
    }
}
