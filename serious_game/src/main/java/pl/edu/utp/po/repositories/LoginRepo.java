package pl.edu.utp.po.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.edu.utp.po.domain.Users;

public interface LoginRepo extends JpaRepository<Users, Long> {
    Users findByLogin(String login);
}
