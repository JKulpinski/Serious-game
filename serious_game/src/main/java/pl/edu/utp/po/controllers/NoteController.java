package pl.edu.utp.po.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class NoteController {

    @GetMapping("/rebus")
    public String showRebuses(Model model) {
        return "rebus";
    }

    @GetMapping("/hangman")
    public String showHangman(Model model) {
        return "hangman";
    }
}
