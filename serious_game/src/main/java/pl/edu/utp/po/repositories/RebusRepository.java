package pl.edu.utp.po.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.edu.utp.po.domain.Rebus;

import java.util.List;

public interface RebusRepository extends JpaRepository<Rebus, Long> {
    List<Rebus> findAll();

    List<Rebus> findByLevel(Long level);
}

