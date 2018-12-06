package pl.edu.utp.po.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GameController {

    @GetMapping("/pictures")
    public String showPictures(Model model) {
        return "pictures";
    }

    @GetMapping("/hangman")
    public String showHangman(Model model) {
        return "hangman";
    }

}
