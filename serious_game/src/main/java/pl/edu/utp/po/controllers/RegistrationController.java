package pl.edu.utp.po.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.edu.utp.po.domain.Users;
import pl.edu.utp.po.services.RegisterService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class RegistrationController {

    private final RegisterService registerService;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public RegistrationController(RegisterService registerService, PasswordEncoder passwordEncoder) {
        this.registerService = registerService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/register")
    public String showRegister(HttpServletRequest req) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user != null) {
            return "redirect:/journey";
        }
        return "register";
    }

    @PostMapping("/register")
    public String addToUsers(Users user, String login, String email, String pass, String pass2,
                             Model model, RedirectAttributes redirectAttributes) {
        boolean valid[] = {false, false, false, false, false, false};
        String error = "";

        if (registerService.findByLogin(login).isEmpty()) { //if there's no this login in database
            valid[0] = true;
            if (login_validation(login)) {
                valid[1] = true;
            } else error += " Wrong User Name. At least 3 signs. Unsupported sign\n";
        } else error += " This User Name is not available.\n";


        if (registerService.findByEmail(email).isEmpty()) {
            valid[2] = true;
            if (email_validation(email)) {
                valid[3] = true;
            } else error += " Wrong email.\n";
        } else error += " This email is not available.\n";


        if (pass_validation(pass)) {
            valid[4] = true;
            user.setPass(passwordEncoder.encode(pass));
            if (pass2.equals(pass)) {
                valid[5] = true;
            } else error += " Password confirmation error.\n";
        } else error += " Wrong password. At least 3 signs. Unsupported sign\n";

        for (boolean b : valid) {
            if (!b) {
                model.addAttribute("alert1", error);
                return "/register";
            }
        }
        registerService.addUser(user);
        redirectAttributes.addFlashAttribute("log_after_registry", "Please insert User Name and password you set during registration");
        return "redirect:/login";
    }

    private boolean login_validation(String login) {
        Matcher matcher = Pattern.compile("^[a-zA-Z0-9._-]{3,}$", Pattern.CASE_INSENSITIVE).matcher(login);
        return matcher.find();
    }

    private boolean email_validation(String email) {
        Matcher matcher = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE).matcher(email);
        return matcher.find();
    }

    private boolean pass_validation(String login) {
        Matcher matcher = Pattern.compile("^[a-zA-Z0-9\\p{P}\\p{S}]{3,}$", Pattern.CASE_INSENSITIVE).matcher(login);
        return matcher.find();
    }
}