package pl.edu.utp.po.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class RebusController {
    @GetMapping("/rebus")
    public String showRebuses(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession();
        if (session.getAttribute("login") == null) {
            return "redirect:/login";
        }
        System.out.println(session.getAttribute("login"));
        return "rebus";
    }
}
