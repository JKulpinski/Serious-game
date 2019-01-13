package pl.edu.utp.po.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.edu.utp.po.domain.LanguageInfo;
import pl.edu.utp.po.domain.Users;
import pl.edu.utp.po.repositories.LanguageInfoRepo;
import pl.edu.utp.po.services.RegisterService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Controller
public class JourneyController {

    @Autowired
    LanguageInfoRepo infoRepo;

    @Autowired
    private RegisterService registerService;   //to dodac zeby updatowac dane usera

    @GetMapping("/journey")
    public String showJourneyPlan(Model model, HttpServletRequest req, @ModelAttribute("second_try") String cheater) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        if (user.getRebus() && user.getHangman() && user.getPicture()) { //sprawdza czy juz przeszles gry
            model.addAttribute("levelup", "Next day of journey!!!");
            user.setLevel(user.getLevel() + 1);
            user.setRebus(false);
            user.setHangman(false);
            user.setPicture(false);
            registerService.addUser(user);
        }
        model.addAttribute("cheater", cheater);  // ostrzezenie przed cheatowaniem
        model.addAttribute("login", user.getLogin());
        model.addAttribute("points", user.getPoints());
        model.addAttribute("level", user.getLevel());

        List<LanguageInfo> rawinfos = infoRepo.findByLevel(user.getLevel());  // uzyskiwanie tresci popupow z bazy
        List<String> infos = new ArrayList<>();
        for (LanguageInfo info : rawinfos)
            infos.add(info.getInfo());
        model.addAttribute("infos", infos);

        if (user.getPicture())     //moze byc do poprawki trzeba sprawdzic dzialanie po doodaniu punktow i levelow do pictures i hangmena
            model.addAttribute("picture", "Matching game has already been completed for this day");
        if (user.getHangman())
            model.addAttribute("hangman", "Hangman game has already been completed for this day");
        if (user.getRebus())
            model.addAttribute("rebus", "Rebus game has already been completed for this day");

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

    @GetMapping("/leaderboard")
    public String showLeader(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("leaders", registerService.leaderlist());
        return "leaderboard";
    }
}
