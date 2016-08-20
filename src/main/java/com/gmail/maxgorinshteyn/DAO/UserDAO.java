package com.gmail.maxgorinshteyn.DAO;

import com.gmail.maxgorinshteyn.Entities.User;

import java.util.List;

public interface UserDAO {
    User findUserByLogin(String login);
    List<User> allUserList();
    void addUserToDB(User user);
}
