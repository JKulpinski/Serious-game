package pl.edu.utp.po.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.edu.utp.po.domain.Hangman;
import pl.edu.utp.po.domain.Picture;

public interface PictureRepository extends JpaRepository<Picture, Long> {
}
