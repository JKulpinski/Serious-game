package pl.edu.utp.po.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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

    @Autowired
    private RebusService rebusService;

    @Autowired
    private RegisterService registerService;

    @GetMapping("/rebus")
    public String showRebuses(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        if (user.getRebus()) {   //zapytanie czy gra zostala wykonana cheatowanie
            return "redirect:/journey";
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

        //System.out.println(user.getLogin());
        return "rebus";
    }

    @PostMapping("/rebus")
    public String addPoints(HttpServletRequest req, String point, RedirectAttributes redirectAttributes) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user.getRebus()) { //cheatowanie
            redirectAttributes.addFlashAttribute("second_try", "You've done this game on this level before!");
            return "redirect:/journey";
        }
        user.setPoints(user.getPoints() + Integer.valueOf(point));
        user.setRebus(!user.getRebus()); // zmienione na nieaktywny rebus po wygranej na danym levelu
        registerService.addUser(user);
        return "redirect:/journey";
    }

}
