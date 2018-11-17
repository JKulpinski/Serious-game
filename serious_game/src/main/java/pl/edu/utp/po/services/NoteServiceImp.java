
package pl.edu.utp.po.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.edu.utp.po.domain.Note;
import pl.edu.utp.po.repositories.NoteRepo;

@Service
public class NoteServiceImp implements NoteService{

    @Autowired
    private NoteRepo noteRepository;
    
    @Override
    public List<Note> listOfNotes(){
        List<Note> lista = noteRepository.findByOrderByTimestampDesc();
        return lista;
    }
    
    @Override
    public void addNote(Note n){
        noteRepository.save(n);
    }
}
