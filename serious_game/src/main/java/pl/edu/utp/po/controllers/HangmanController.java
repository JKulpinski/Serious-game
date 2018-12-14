package pl.edu.utp.po.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.edu.utp.po.domain.Hangman;
import pl.edu.utp.po.domain.Users;
import pl.edu.utp.po.repositories.HangmanRepository;
import pl.edu.utp.po.services.RegisterService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Controller
public class HangmanController {

    @Autowired
    private HangmanRepository hangmanRepo;

    @Autowired
    private RegisterService registerService;

    @GetMapping("/hangman")
    public String showHangman(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        if (user.getHangman()) {   //zapytanie czy gra zostala wykonana cheatowanie
            return "redirect:/journey";
        }

        List<Hangman> hangmans = hangmanRepo.findByLevel(user.getLevel()); //punkty i pobieranie odpowiednich zagadek
        List<String> answers = new ArrayList<>();
        List<String> translation = new ArrayList<>();
        for (Hangman hangman : hangmans) {
            answers.add(hangman.getAnswer());
            translation.add(hangman.getTranslation());
        }
        model.addAttribute("answers", answers);
        model.addAttribute("translation", translation);
        return "hangman";
    }

    @PostMapping("/hangman")
    public String addPoints(HttpServletRequest req, String point) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user.getHangman()) { //cheatowanie
            return "redirect:/journey";
        }
        user.setPoints(user.getPoints() + Integer.valueOf(point));
        user.setHangman(!user.getHangman()); // zmienione na nieaktywny rebus po wygranej na danym levelu
        registerService.addUser(user);
        return "redirect:/journey";
    }
}
