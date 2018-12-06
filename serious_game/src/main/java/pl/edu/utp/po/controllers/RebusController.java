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
        List<Rebus> rebuses = rebusService.listbylevelid(user.getLevel());
        List<String> filenames = new ArrayList<>();
        List<String> answers = new ArrayList<>();
        for (Rebus rebus : rebuses) {
            filenames.add(rebus.getRebus());
            answers.add(rebus.getAnswer());
        }
        model.addAttribute("filenames", filenames);
        model.addAttribute("answers", answers);
        //System.out.println(user.getLogin());
        return "rebus";
    }

    @PostMapping("/rebus")
    public String addPoints(HttpServletRequest req, String point) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        user.setPoints(user.getPoints() + Integer.valueOf(point));
        registerService.addUser(user);
        return "redirect:/journey";
    }

}
