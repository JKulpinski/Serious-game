package pl.edu.utp.po.services;

import pl.edu.utp.po.domain.Runner;

import java.util.List;

public interface RunnerService {
    List<Runner> listByLevelId(Long level);
}
