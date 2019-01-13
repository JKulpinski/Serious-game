package pl.edu.utp.po.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.edu.utp.po.domain.Users;

import java.util.List;

public interface RegisterRepo extends JpaRepository<Users,Long> {
    List<Users> findByLogin(String login);
    List<Users> findByEmail(String email);

    List<Users> findByOrderByPointsDesc();
}
