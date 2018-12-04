package pl.edu.utp.po.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.edu.utp.po.domain.Users;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class JourneyController {
    @GetMapping("/journey")
    public String showJourneyPlan(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("login", user.getLogin());
        model.addAttribute("points", user.getPoints());

        return "journey";
    }

    @GetMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/login";
    }
}
