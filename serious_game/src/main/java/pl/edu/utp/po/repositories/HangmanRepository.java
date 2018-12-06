package pl.edu.utp.po.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.edu.utp.po.domain.Hangman;

public interface HangmanRepository extends JpaRepository<Hangman, Long> {
}
