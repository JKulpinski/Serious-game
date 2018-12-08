package pl.edu.utp.po.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.edu.utp.po.domain.Users;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class JourneyController {
    @GetMapping("/journey")
    public String showJourneyPlan(Model model, HttpServletRequest req, @ModelAttribute("second_try") String cheater) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("cheater", cheater);  // ostrzezenie przed cheatowaniem
        model.addAttribute("login", user.getLogin());
        model.addAttribute("points", user.getPoints());
        model.addAttribute("level", user.getLevel());

        if (user.getPicture())
            model.addAttribute("picture", "Pictures game finished on this level");
        if (user.getHangman())
            model.addAttribute("hangman", "Hangman game finished on this level");
        if (user.getRebus())
            model.addAttribute("rebus", "Rebus game finished on this level");
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
