import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mixbox/page/editing_note.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import '../models/note_data.dart';

class noteTest extends StatefulWidget {
  const noteTest({super.key});

  @override
  State<noteTest> createState() => _noteTestState();
}

class _noteTestState extends State<noteTest> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    Provider.of<NoteData>(context, listen: false).initializeNotes();
  }

  void createNewNote() {
    //id generate
    int id = Provider.of<NoteData>(
      context,
      listen: false,
    ).getAllNotes().length;

    //create blank note here
    Note newNote = Note(id: id, text: '');
    goToNotePage(newNote, true);
    //go to note page
  }

  void goToNotePage(Note note, bool isNewNote) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditingNotePage(
            note: note,
            isNewNote: isNewNote,
          ),
        ));

    //delete note
  }

  void deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: createNewNote,
          elevation: 0,
          backgroundColor: Colors.grey,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset(
              'assets/logo1.png',
              width: 40,
              height: 40,
            ),
            onPressed: () {},
          ),
          // title: Text(
          //   'Notes',
          //   style: TextStyle(
          //     color: Colors.black,
          //     fontWeight: FontWeight.bold,
          //     fontSize: 40,
          //   ),
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //header
              //listview of Note
              value.getAllNotes().length == 0
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child:
                              Text('Nothing is here, try adding some note...')),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoListSection.insetGrouped(
                            children: List.generate(
                              value.getAllNotes().length, //Lenght of the list
                              (index) => CupertinoListTile(
                                title: Text(value.getAllNotes()[index].text),
                                onTap: () => goToNotePage(
                                    value.getAllNotes()[index], false),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () =>
                                      deleteNote(value.getAllNotes()[index]),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  void submit() {
    Navigator.of(context).pop(controller.text);
  }

  Future<String?> changeName() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            content: TextField(
              autofocus: true, //auto keyboard
              decoration: InputDecoration(
                  hintText: 'Enter your name', hoverColor: Colors.black),
              controller: controller,
            ),
            actions: [
              IconButton(onPressed: submit, icon: Icon(Icons.add_outlined))
            ],
          ));
}
