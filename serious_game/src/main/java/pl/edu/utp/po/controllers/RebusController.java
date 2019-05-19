package pl.edu.utp.po.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.edu.utp.po.domain.Rebus;
import pl.edu.utp.po.domain.Users;
import pl.edu.utp.po.services.RebusService;
import pl.edu.utp.po.services.RegisterService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RebusController {

    private final RebusService rebusService;

    private final RegisterService registerService;

    @Autowired
    public RebusController(RebusService rebusService, RegisterService registerService) {
        this.rebusService = rebusService;
        this.registerService = registerService;
    }

    @GetMapping("/rebus")
    public String showRebuses(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        if (user.getRebus().equals(2) || user.getRebus().equals(1)) {
            return "redirect:/journey";
        }
        else {
            user.setRebus(1);
            registerService.addUser(user);
        }
        List<Rebus> rebuses = rebusService.listbylevelid(user.getLevel()); //punkty i pobieranie odpowiednich zagadek
        List<String> filenames = new ArrayList<>();
        List<String> answers = new ArrayList<>();
        List<String> translation_pl = new ArrayList<>();
        for (Rebus rebus : rebuses) {
            filenames.add(rebus.getRebus());
            answers.add(rebus.getAnswer());
            translation_pl.add(rebus.getTranslation_pl());
        }
        model.addAttribute("filenames", filenames);
        model.addAttribute("answers", answers);
        model.addAttribute("translation_pl", translation_pl);
        return "rebus";
    }

    @PostMapping("/rebus")
    public String addPoints(HttpServletRequest req, String point) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (!point.equals("0")) {
            user.setPoints(user.getPoints() + Integer.valueOf(point));
            user.setCoins(user.getCoins() + 1);
            user.setRebus(2); // zmienione na nieaktywny rebus po wygranej na danym levelu
            registerService.addUser(user);
        }
        else user.setRebus(1);
        return "redirect:/journey";
    }
}
