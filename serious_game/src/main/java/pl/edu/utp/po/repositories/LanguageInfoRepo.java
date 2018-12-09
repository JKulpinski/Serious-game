package pl.edu.utp.po.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.edu.utp.po.domain.LanguageInfo;

import java.util.List;

public interface LanguageInfoRepo extends JpaRepository<LanguageInfo, Long> {
    List<LanguageInfo> findByLevel(Long level);
}
