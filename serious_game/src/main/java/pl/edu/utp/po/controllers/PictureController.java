package pl.edu.utp.po.controllers;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.edu.utp.po.domain.Users;
import pl.edu.utp.po.services.PictureService;

import javax.servlet.http.HttpSession;

@Controller
public class PictureController {

    @Autowired
    private PictureService pictureService;
    @GetMapping("/pictures")
    public String showPictures(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        return "pictures";
    }

}