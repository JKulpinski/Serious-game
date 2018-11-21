package pl.edu.utp.po.services;

import pl.edu.utp.po.domain.Users;

import java.util.List;

public interface RegisterService {
    void addUser(Users n);
    List<Users> findByLogin(String login);
}
