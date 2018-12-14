package pl.edu.utp.po.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.edu.utp.po.domain.Picture;
import pl.edu.utp.po.repositories.PictureRepository;

import java.util.List;

@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Service
public class PictureServiceImp implements PictureService{

    @Autowired
    private PictureRepository pictureRepository;

    @Override
    public List<Picture> listByLevelId(Long level) {
        return pictureRepository.findByLevel(level);
    }
}
