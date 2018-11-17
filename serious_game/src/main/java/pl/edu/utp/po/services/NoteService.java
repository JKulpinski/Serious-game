package pl.edu.utp.po.services;

import java.util.List;
import pl.edu.utp.po.domain.Note;

public interface NoteService {

    List<Note> listOfNotes(); 
    void addNote(Note n);
}
