package pl.edu.utp.po.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.edu.utp.po.domain.Payments;
import pl.edu.utp.po.repositories.PaymentRepo;

@Service
public class PaymentServiceImp implements PaymentService{
    final PaymentRepo paymentRepo;

    @Autowired
    public PaymentServiceImp(PaymentRepo paymentRepo) {
        this.paymentRepo = paymentRepo;
    }

    @Override
    public void addPayment(Payments n) {
        paymentRepo.save(n);
    }
}
