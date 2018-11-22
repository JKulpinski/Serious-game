package pl.edu.utp.po.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.edu.utp.po.domain.Users;
import pl.edu.utp.po.repositories.RegisterRepo;

import java.util.List;

@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Service
public class RegisterServiceImp implements RegisterService {

    @Autowired
    RegisterRepo registerRepo;

    @Override
    public void addUser(Users n) {
        registerRepo.save(n);
    }

    @Override
    public List<Users> findByLogin(String login) {
        return registerRepo.findByLogin(login);
    }

    @Override
    public List<Users> findByEmail(String email) { return registerRepo.findByEmail(email); }
}
