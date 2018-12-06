package pl.edu.utp.po.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.edu.utp.po.domain.Rebus;
import pl.edu.utp.po.domain.Users;
import pl.edu.utp.po.services.RebusService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RebusController {

    @Autowired
    private RebusService rebusService;

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

}
