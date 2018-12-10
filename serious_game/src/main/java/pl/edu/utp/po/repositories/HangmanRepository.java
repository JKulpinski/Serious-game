package pl.edu.utp.po.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.edu.utp.po.domain.Hangman;

import java.util.List;

public interface HangmanRepository extends JpaRepository<Hangman, Long> {

    List<Hangman> findByLevel(Long level);
}
