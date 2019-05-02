package pl.edu.utp.po.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.edu.utp.po.domain.Runner;

import java.util.List;

public interface RunnerRepository extends JpaRepository<Runner, Long> {
    List<Runner> findByLevel(Long level);
}
