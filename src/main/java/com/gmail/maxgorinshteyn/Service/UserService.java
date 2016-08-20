package com.gmail.maxgorinshteyn.Service;

import com.gmail.maxgorinshteyn.Entities.User;

public interface UserService {
    User getUserByLogin(String login);
}
