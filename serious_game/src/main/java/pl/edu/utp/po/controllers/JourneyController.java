package pl.edu.utp.po.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import pl.edu.utp.po.domain.LanguageInfo;
import pl.edu.utp.po.domain.Users;
import pl.edu.utp.po.repositories.LanguageInfoRepo;
import pl.edu.utp.po.services.RegisterService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Controller
public class JourneyController {

    final LanguageInfoRepo infoRepo;

    private final RegisterService registerService;   //to dodac zeby updatowac dane usera

    @Autowired
    public JourneyController(LanguageInfoRepo infoRepo, RegisterService registerService) {
        this.infoRepo = infoRepo;
        this.registerService = registerService;
    }

    @PostMapping("/journey")
    public String changeLanguage(HttpServletRequest req, @RequestParam String language) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        } else {
            user.setLanguage(language);
            Locale l = new Locale(language);
            SessionLocaleResolver slr = new SessionLocaleResolver();
            slr.setDefaultLocale(l);
        }
        return "journey";
    }

    @GetMapping("/journey")
    public String showJourneyPlan(Model model, HttpServletRequest req, @ModelAttribute("second_try") String cheater) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        String language = user.getLanguage();
        Locale l = new Locale(language);
        SessionLocaleResolver slr = new SessionLocaleResolver();
        slr.setDefaultLocale(l);

        if (user.getLevel() == 7 && user.getRebus() && user.getHangman() && user.getRunner()) {
            model.addAttribute("levelup", "Next day of journey!!!");
            user.setPoints(user.getPoints() + 25);
            user.setCoins(user.getCoins() + 5);
            user.setLevel(user.getLevel() + 1);
            registerService.addUser(user);
        }

        if (user.getRebus() && user.getHangman() && user.getRunner() && user.getLevel() != 7 && user.getLevel() != 8) {
            //sprawdza czy juz przeszedles gry
            model.addAttribute("levelup", "Next day of journey!!!");
            user.setLevel(user.getLevel() + 1);
            user.setRebus(false);
            user.setHangman(false);
            user.setRunner(false);
            registerService.addUser(user);
        }
        model.addAttribute("cheater", cheater);  // ostrzezenie przed cheatowaniem
        model.addAttribute("login", user.getLogin());
        model.addAttribute("points", user.getPoints());
        model.addAttribute("level", user.getLevel());
        model.addAttribute("coins", user.getCoins());

        List<LanguageInfo> rawinfos = infoRepo.findByLevel(user.getLevel());  // uzyskiwanie tresci popupow z bazy
        List<String> infos = new ArrayList<>();
        for (LanguageInfo info : rawinfos)
            infos.add(info.getInfo());
        model.addAttribute("infos", infos);

        List<String> infos_pl = new ArrayList<>();
        for (LanguageInfo info_pl : rawinfos)
            infos_pl.add(info_pl.getInfo_pl());
        model.addAttribute("infos_pl", infos_pl);

        if (user.getRunner())
            model.addAttribute("runner", user.getRunner());
        if (user.getHangman())
            model.addAttribute("hangman", user.getHangman());
        if (user.getRebus())
            model.addAttribute("rebus", user.getRebus());

        model.addAttribute("lang", language);
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

    @GetMapping("/unlock")
    public String unlockGame(HttpServletRequest req) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        } else {
            int howManyPoints = user.getCoins();
            if (user.getHangman()) {
                if (howManyPoints >= 3) {
                    howManyPoints -= 3;
                    user.setHangman(false); //zmienic na flagi, 1 przeszedl, 2 przegral, 3 nic nie robil
                }
            }
            if (user.getRunner()) {
                if (howManyPoints >= 3) {
                    howManyPoints -= 3;
                    user.setRunner(false);
                }
            }
            if (user.getRebus())
                if (howManyPoints >= 3) {
                    howManyPoints -= 3;
                    user.setRebus(false);
                }

            user.setCoins(howManyPoints);
            registerService.addUser(user);
            return "redirect:/journey";
        }
    }
}
