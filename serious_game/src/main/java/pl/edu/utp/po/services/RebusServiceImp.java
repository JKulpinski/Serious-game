package pl.edu.utp.po.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.edu.utp.po.domain.Rebus;
import pl.edu.utp.po.repositories.RebusRepository;

import java.util.List;

@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Service
public class RebusServiceImp implements RebusService{

    @Autowired
    private RebusRepository rebusRepository;

    @Override
    public List<Rebus> listofRebuses() {
        return  rebusRepository.findAll();
    }

    @Override
    public List<Rebus> listbylevelid(Long level) {
        return rebusRepository.findByLevel(level);
    }
}
