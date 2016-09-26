package com.gmail.maxgorinshteyn.Service;

import com.gmail.maxgorinshteyn.Entities.Client;

public interface UserService {
    Client getUserByLogin(String login);
}
