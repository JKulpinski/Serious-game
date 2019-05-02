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
import pl.edu.utp.po.services.PaypalService;
import pl.edu.utp.po.util.URLUtils;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PaymentController {

    public static final String PAYPAL_SUCCESS_URL = "/pay/success";
    public static final String PAYPAL_CANCEL_URL = "/pay/cancel";

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private PaypalService paypalService;

    @GetMapping("/payment")
    public String payment(){
        return "payment";
    }

    @PostMapping("/pay")
    public String pay(HttpServletRequest request){
        String cancelUrl = URLUtils.getBaseURL(request) + PAYPAL_CANCEL_URL;
        String successUrl = URLUtils.getBaseURL(request) + PAYPAL_SUCCESS_URL;
        try {
            Payment payment = paypalService.createPayment(
                    4d,
                    "USD",
                    PaypalPaymentMethod.paypal,
                    PaypalPaymentIntent.sale,
                    "payment description",
                    cancelUrl,
                    successUrl);
            for(Links links : payment.getLinks()){
                if(links.getRel().equals("approval_url")){
                    return "redirect:" + links.getHref();
                }
            }
        } catch (PayPalRESTException e) {
            logger.error(e.getMessage());
        }
        return "redirect:/pay";
    }

    @GetMapping(PAYPAL_CANCEL_URL)
    public String cancelPay(){
        return "cancel";
    }

    @GetMapping(PAYPAL_SUCCESS_URL)
    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId){
        try {
            Payment payment = paypalService.executePayment(paymentId, payerId);
            if(payment.getState().equals("approved")){
                return "success";
            }
        } catch (PayPalRESTException e) {
            logger.error(e.getMessage());
        }
        return "redirect:/";
    }
}
