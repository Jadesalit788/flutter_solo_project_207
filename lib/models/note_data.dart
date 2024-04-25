import 'package:flutter/material.dart';
import 'package:mixbox/models/data.dart';

import 'note.dart';

class NoteData extends ChangeNotifier {
//database link
  final db = HiveDatabase();

//overall listview of note

  List<Note> allNotes = [];

  // initialize list
  void initializeNotes() {
    allNotes = db.loadNotes();
  }

//  get note
  List<Note> getAllNotes() {
    return allNotes;
  }

//add new note
  void addNewNote(Note note) {
    allNotes.add(note);
    db.savedNotes(allNotes);
    notifyListeners();
  }

//update note
  void updateNote(Note note, String text) {
    //go through the note to find a correct note to add
    for (int i = 0; i < allNotes.length; i++) {
      if (allNotes[i].id == note.id) {
        allNotes[i].text = text;
        db.savedNotes(allNotes); // Save changes to the database
        notifyListeners();
        return;
      }
    }
    notifyListeners();
  }

//delete note
  void deleteNote(Note note) {
    allNotes.remove(note);
    notifyListeners();
    return;
  }
}
