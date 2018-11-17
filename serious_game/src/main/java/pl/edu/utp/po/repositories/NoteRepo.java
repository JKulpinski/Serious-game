package pl.edu.utp.po.repositories;
import pl.edu.utp.po.domain.Note;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NoteRepo extends JpaRepository<Note, Long> {
    List<Note> findByOrderByTimestampDesc(); 
}
