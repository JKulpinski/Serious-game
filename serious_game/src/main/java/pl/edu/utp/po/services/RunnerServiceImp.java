package pl.edu.utp.po.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.edu.utp.po.domain.Runner;
import pl.edu.utp.po.repositories.RunnerRepository;

import java.util.List;

@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Service
public class RunnerServiceImp implements RunnerService {

    private final RunnerRepository runnerRepository;

    @Autowired
    public RunnerServiceImp(RunnerRepository runnerRepository) {
        this.runnerRepository = runnerRepository;
    }

    @Override
    public List<Runner> listByLevelId(Long level) {
        return runnerRepository.findByLevel(level);
    }
}
