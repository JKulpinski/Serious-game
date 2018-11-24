package pl.edu.utp.po.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.edu.utp.po.repositories.LoginRepo;

@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Controller
public class LoginController {

    @Autowired
    private LoginRepo loginRepo;

    @GetMapping("/login")
    public String showLogin(Model model, @ModelAttribute("log_after_registry") String log_after_reg_info) {
        model.addAttribute("alert", log_after_reg_info);
        return "login";
    }

    @PostMapping("/login")
    public String checkLogin(Model model, String login, String password) {
        if (loginRepo.findByLogin(login) != null
                && loginRepo.findByLogin(login).getPass().equals(password)) {
            return "redirect:/pictures";
        }
        model.addAttribute("error_pass", "Wrong login or password");

        return "/login";
    }
}
