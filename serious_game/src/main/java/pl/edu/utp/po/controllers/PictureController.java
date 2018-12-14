package pl.edu.utp.po.controllers;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.edu.utp.po.domain.Picture;
import pl.edu.utp.po.domain.Users;
import pl.edu.utp.po.repositories.PictureRepository;
import pl.edu.utp.po.services.PictureService;
import pl.edu.utp.po.services.RegisterService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class PictureController {

    @Autowired
    private PictureService pictureService;

    @Autowired
    private RegisterService registerService;


    @GetMapping("/pictures")
    public String showPictures(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        if (user.getPicture()) {   //zapytanie czy gra zostala wykonana cheatowanie
            return "redirect:/journey";
        }

        List<Picture> pictures = pictureService.listByLevelId(user.getLevel()); //punkty i pobieranie odpowiednich
        List<String> answers = new ArrayList<>();
        List<String> texts = new ArrayList<>();
        for (Picture picture: pictures) {
            texts.add(picture.getText());
            answers.add(picture.getAnswer());
        }
        model.addAttribute("answers", answers);
        model.addAttribute("texts", texts);
        return "pictures";
    }

    @PostMapping("/pictures")
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