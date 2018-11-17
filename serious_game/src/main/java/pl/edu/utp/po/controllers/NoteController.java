package pl.edu.utp.po.controllers;

import pl.edu.utp.po.domain.Note;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.edu.utp.po.services.NoteService;

@Controller
public class NoteController {

    @Autowired
    private NoteService noteService;

    @GetMapping("/list")
    public String readersNotes(Model model) {
        model.addAttribute("notes", noteService.listOfNotes());
        return "notes";
    }

    @PostMapping("/list")
    public String addToReadingList(Note note) {
        noteService.addNote(note);
        return "redirect:/list";
    }
}
