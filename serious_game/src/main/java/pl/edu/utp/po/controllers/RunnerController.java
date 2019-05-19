package pl.edu.utp.po.controllers;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.edu.utp.po.domain.Runner;
import pl.edu.utp.po.domain.Users;
import pl.edu.utp.po.services.RegisterService;
import pl.edu.utp.po.services.RunnerService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RunnerController {

    private final RunnerService runnerService;

    private final RegisterService registerService;

    @Autowired
    public RunnerController(RunnerService runnerService, RegisterService registerService) {
        this.runnerService = runnerService;
        this.registerService = registerService;
    }

    @GetMapping("/runner")
    public String showRunner(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        if (user.getRunner().equals(1) || user.getRunner().equals(2)) {
            return "redirect:/journey";
        }
        else {
            user.setRunner(1);
            registerService.addUser(user);
        }

        List<Runner> runners = runnerService.listByLevelId(user.getLevel()); //punkty i pobieranie odpowiednich
        List<String> answers = new ArrayList<>();
        List<String> texts = new ArrayList<>();
        for (Runner runner : runners) {
            texts.add(runner.getText());
            answers.add(runner.getAnswer());
        }
        model.addAttribute("answers", answers);
        model.addAttribute("texts", texts);
        return "runner";
    }

    @PostMapping("/runner")
    public String addPoints(HttpServletRequest req, String point) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (!point.equals("0")) {
            user.setPoints(user.getPoints() + Integer.valueOf(point));
            user.setCoins(user.getCoins() + 1);
            user.setRunner(2);
        }
        else user.setRunner(1);
        registerService.addUser(user);
        return "redirect:/journey";
    }
}