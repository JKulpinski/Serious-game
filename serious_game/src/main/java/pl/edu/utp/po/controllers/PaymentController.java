package pl.edu.utp.po.controllers;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.edu.utp.po.config.PaypalPaymentIntent;
import pl.edu.utp.po.config.PaypalPaymentMethod;
import pl.edu.utp.po.domain.Payments;
import pl.edu.utp.po.domain.Users;
import pl.edu.utp.po.services.PaymentService;
import pl.edu.utp.po.services.PaypalService;
import pl.edu.utp.po.services.RegisterService;
import pl.edu.utp.po.util.URLUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class PaymentController {

    public static final String PAYPAL_SUCCESS_URL = "/pay/success";
    public static final String PAYPAL_CANCEL_URL = "/pay/cancel";

    public double price = 0;

    private Logger logger = LoggerFactory.getLogger(getClass());

    private final PaypalService paypalService;

    private final PaymentService paymentService;

    private final RegisterService registerService;

    @Autowired
    public PaymentController(PaypalService paypalService, PaymentService paymentService, RegisterService registerService) {
        this.paypalService = paypalService;
        this.paymentService = paymentService;
        this.registerService = registerService;
    }

    @GetMapping("/payment")
    public String payment(HttpServletRequest req){
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        else {
            return "payment";
        }
    }

    @PostMapping("/pay")
    public String pay(HttpServletRequest request,@RequestParam("price") double price){
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        else {
            String cancelUrl = URLUtils.getBaseURL(request) + PAYPAL_CANCEL_URL;
            String successUrl = URLUtils.getBaseURL(request) + PAYPAL_SUCCESS_URL;
            this.price=price;
            try {
                Payment payment = paypalService.createPayment(
                        price,
                        "PLN",
                        PaypalPaymentMethod.paypal,
                        PaypalPaymentIntent.sale,
                        "payment description",
                        cancelUrl,
                        successUrl);
                for (Links links : payment.getLinks()) {
                    if (links.getRel().equals("approval_url")) {
                        return "redirect:" + links.getHref();
                    }
                }
            } catch (PayPalRESTException e) {
                logger.error(e.getMessage());
                return "redirect:/cancel";
            }
            return "redirect:/pay";
        }
    }

    @GetMapping(PAYPAL_CANCEL_URL)
    public String cancelPay(){
        return "cancel";
    }

    @GetMapping(PAYPAL_SUCCESS_URL)
    public String successPay(HttpServletRequest req, @RequestParam("paymentId") String paymentId, @RequestParam(
            "PayerID") String payerId){
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        else {
            String status = "";
            try {
                Payment payment = paypalService.executePayment(paymentId, payerId);
                if (payment.getState().equals("approved")) {
                    status = "success";
                    return status;
                }
            } catch (PayPalRESTException e) {
                logger.error(e.getMessage());
                status = "cancel";
                return "redirect:/cancel";
            } finally {
                Payments newPayment = new Payments();
                newPayment.setAmount(price);
                newPayment.setCurrency("PLN");
                newPayment.setUserID(user.getId());
                newPayment.setStatus(status);
                paymentService.addPayment(newPayment);

                if (status=="success"){
                    int newMonets = 0;
                    switch((int) Math.round(price)){
                        case 1: newMonets=4; break;
                        case 2: newMonets=10; break;
                        case 5: newMonets=30; break;
                        case 10: newMonets=75; break;
                        case 20: newMonets=200; break;
                    }
                    if (newMonets!=0) {
                        user.setCoins(user.getCoins() + newMonets);
                        registerService.addUser(user);
                    }
                    else{
                        logger.error("There are no more coins!");
                    }
                }
            }
        }
        return "redirect:/";
    }
}