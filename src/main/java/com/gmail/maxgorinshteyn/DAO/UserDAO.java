package com.gmail.maxgorinshteyn.DAO;

import com.gmail.maxgorinshteyn.Entities.Client;

import java.util.List;

public interface UserDAO {
    Client findUserByLogin(String login);
    List<Client> allUserList();
    void addUserToDB(Client user);
}
