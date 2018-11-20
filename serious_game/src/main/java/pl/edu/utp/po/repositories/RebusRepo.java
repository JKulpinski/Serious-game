package pl.edu.utp.po.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.edu.utp.po.domain.Rebus;

import java.util.List;

public interface RebusRepo extends JpaRepository<Rebus, Long> {
    //List<Rebus> findById(Long id);
    List<Rebus> findAll();
}

