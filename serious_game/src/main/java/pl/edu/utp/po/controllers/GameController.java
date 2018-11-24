package pl.edu.utp.po.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.edu.utp.po.services.RebusService;

@Controller
public class GameController {

    @Autowired
    private RebusService rebusService;

    @GetMapping("/pictures")
    public String showPictures(Model model) {
        return "pictures";
    }

    @GetMapping("/rebus")
    public String showRebuses(Model model) {
        model.addAttribute("rebus", rebusService.listofRebuses());
        return "rebus";
    }

    @GetMapping("/hangman")
    public String showHangman(Model model) {
        return "hangman";
    }

}
