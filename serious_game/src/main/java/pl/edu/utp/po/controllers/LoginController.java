package pl.edu.utp.po.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.edu.utp.po.domain.Users;
import pl.edu.utp.po.repositories.LoginRepo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Controller
public class LoginController {

    private final LoginRepo loginRepo;

    @Autowired
    public LoginController(LoginRepo loginRepo) {
        this.loginRepo = loginRepo;
    }

    @GetMapping("/")
    public String redirect() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLogin(Model model, @ModelAttribute("log_after_registry") String log_after_reg_info,
                            HttpServletRequest req) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user != null) {
            return "redirect:/journey";
        }
        model.addAttribute("alert", log_after_reg_info);
        return "login";
    }

    @PostMapping("/login")
    public String checkLogin(Model model, String login, String password, HttpServletRequest req) {
        Users user = loginRepo.findByLogin(login);
        if (user != null && user.getPass().equals(password)) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            return "redirect:/journey";
        }
        model.addAttribute("error_pass", "Wrong login or password");
        return "/login";
    }
}
