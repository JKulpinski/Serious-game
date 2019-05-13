package pl.edu.utp.po.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.edu.utp.po.domain.Payments;

public interface PaymentRepo extends JpaRepository<Payments,Long> {

}
