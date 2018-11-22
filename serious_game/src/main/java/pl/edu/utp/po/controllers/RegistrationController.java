package pl.edu.utp.po.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.edu.utp.po.domain.Users;
import pl.edu.utp.po.services.RegisterService;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class RegistrationController {

    @Autowired
    private RegisterService registerService;

    @GetMapping("/register")
    public String showRegister(Model model) {
        return "register";
    }

    @PostMapping("/register")
    public String addToUsers(Users user, String login, String email, String pass, String pass2, Model model) {
        boolean valid[] = {false,false,false,false,false,false};

        if (registerService.findByLogin(login).isEmpty()) { //if there's no this login in database
            valid[0] = true;
            if(login_validation(login)){
                valid[1] = true;
            }
            else{
                model.addAttribute("alert1","Wrong User Name. At least 3 signs. Without special signs");
            }
        }
        else{
            model.addAttribute("alert2","This User Name is not available");
        }


        if (registerService.findByEmail(email).isEmpty()){
            valid[2] = true;
            if(email_validation(email)){
                valid[3]=true;
            }
            else{
                model.addAttribute("alert3","Wrong email");
            }
        }
        else{
            model.addAttribute("alert4","This email is not available");
        }


        if (login_validation(pass)){
            valid[4] = true;
            if(pass2.equals(pass)){
                valid[5]=true;
            }
            else
                model.addAttribute("alert5","Password confirmation error");
        }
        else {
            model.addAttribute("alert6","Wrong password. At least 3 signs. Without special signs");
        }

        for(boolean b:valid){
            if(!b){
                return "register";
            }
        }
        registerService.addUser(user);
        return "redirect:/login";
    }

    private boolean login_validation(String login){
        Matcher matcher = Pattern.compile("^[a-zA-Z0-9._-]{3,}$", Pattern.CASE_INSENSITIVE).matcher(login);
        return matcher.find();
    }

    private boolean email_validation(String email){
        Matcher matcher = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE).matcher(email);
        return matcher.find();
    }
}
