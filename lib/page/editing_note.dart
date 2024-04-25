import 'package:flutter/material.dart';
import 'package:mixbox/models/note.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:mixbox/models/note_data.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditingNotePage extends StatefulWidget {
  Note note;
  bool isNewNote;
  EditingNotePage({super.key, required this.note, required this.isNewNote});

  @override
  State<EditingNotePage> createState() => _EditingNotePageState();
}

class _EditingNotePageState extends State<EditingNotePage> {
  QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    loadExistingNote();
  }

  //load Existing Note
  void loadExistingNote() {
    final doc = Document()..insert(0, widget.note.text);
    setState(() {
      _controller = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  //add new note
  void addNewNote() {
    //get new id
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;

    //get text from editor
    String text = _controller.document.toPlainText();
    //add the new note
    Provider.of<NoteData>(context, listen: false)
        .addNewNote(Note(id: id, text: text));
  }

  //update note
  void updateNote() {
    //get text from editor
    String text = _controller.document.toPlainText();
    //replace text from editor
    Provider.of<NoteData>(context, listen: false).updateNote(widget.note, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              //is it a new note?
              if (widget.isNewNote && !_controller.document.isEmpty()) {
                addNewNote();
              }
              //is it an exited note?
              else {
                updateNote();
              }

              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            )),
        title: Text('Note Editor'),
      ),
      body: Column(
        children: [
          QuillToolbar(
            configurations: const QuillToolbarConfigurations(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                children: [
                  QuillToolbarHistoryButton(
                    isUndo: true,
                    controller: _controller,
                  ),
                  QuillToolbarHistoryButton(
                    isUndo: false,
                    controller: _controller,
                  ),
                  QuillToolbarToggleStyleButton(
                    options: const QuillToolbarToggleStyleButtonOptions(),
                    controller: _controller,
                    attribute: Attribute.bold,
                  ),
                  QuillToolbarToggleStyleButton(
                    options: const QuillToolbarToggleStyleButtonOptions(),
                    controller: _controller,
                    attribute: Attribute.italic,
                  ),
                  QuillToolbarToggleStyleButton(
                    controller: _controller,
                    attribute: Attribute.underline,
                  ),
                  QuillToolbarClearFormatButton(
                    controller: _controller,
                  ),
                ],
              ),
            ),
            //second Line
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Expanded(
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  placeholder: 'Start writting your notes...',
                  scrollable: true,
                  controller: _controller,
                  readOnly: false,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('de'),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
