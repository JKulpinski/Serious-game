package pl.edu.utp.po.services;

import pl.edu.utp.po.domain.Picture;

import java.util.List;

public interface PictureService {
    List<Picture> listByLevelId(Long level);
}
