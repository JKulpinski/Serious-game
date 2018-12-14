package pl.edu.utp.po.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.edu.utp.po.domain.Picture;

import java.util.List;

public interface PictureRepository extends JpaRepository<Picture, Long> {
    List<Picture> findByLevel(Long level);
}
