import 'package:hive_flutter/adapters.dart';
import 'package:mixbox/models/note.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  //reference
  final _myBox = Hive.box('note_database');
  //load
  List<Note> loadNotes() {
    List<Note> savedNotesFormatted = [];

    if (_myBox.containsKey("ALL_NOTES")) {
      List<dynamic> savedNotes = _myBox.get("ALL_NOTES");
      for (int i = 0; i < savedNotes.length; i++) {
        //create individual note
        Note individualNote =
            Note(id: savedNotes[i][0], text: savedNotes[i][1]);

        //add to list in App
        savedNotesFormatted.add(individualNote);
      }
    } else {
      savedNotesFormatted.add(Note(id: 0, text: 'Example'));
    }
    return savedNotesFormatted;
  }

  void savedNotes(List<Note> allNotes) {
    List<dynamic> allNotesFormatted = [];
    for (var note in allNotes) {
      int id = note.id;
      String text = note.text;
      allNotesFormatted.add([id, text]);
    }
    //each note have id and text
    _myBox.put("ALL_NOTES", allNotesFormatted);
  }
}
