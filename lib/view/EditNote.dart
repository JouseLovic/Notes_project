import 'package:flutter/material.dart';
import 'package:notes_project/controller/NoteController.dart';
import '../model/Note.dart';

// ignore: must_be_immutable
class editNote extends StatefulWidget {
  int index;
  note Note;
  editNote(this.index, this.Note, {super.key});

  @override
  State<editNote> createState() => _editNoteState();
}

class _editNoteState extends State<editNote> {
  late TextEditingController textTitleController;
  late TextEditingController textContentController;
  late String title;
  late String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 58, 58, 58),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 59, 59, 59),
        elevation: 8,
        title: Text("Edit your note",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: IconButton(
                  splashRadius: 20,
                  icon: Icon(Icons.check),
                  onPressed: () {
                    final Note = new note(title, content, widget.Note.getDate(),
                        2, widget.Note.getFavorite(), DateTime.now());
                        noteController.setUpdateNote(widget.index, Note);
                        Navigator.pop(context);
                  },
                ),
              ),
              Container(
                child: IconButton(
                  splashRadius: 20,
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 2,
                  right: 7,
                  left: 7,
                ),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    autocorrect: true,
                    controller: textTitleController,
                    decoration: InputDecoration(
                        hintText: "Your title",
                        hintStyle: TextStyle(color: Colors.grey)),
                    style: TextStyle(color: Colors.white, fontSize: 22),
                    onChanged: (value) => {title = value},
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    autocorrect: true,
                    controller: textContentController,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration.collapsed(
                      hintText: "Write your thoughts",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (value) => {content = value},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    title = widget.Note.getTitle();
    content = widget.Note.getContent();
    textContentController = TextEditingController(text: content);
    textTitleController = TextEditingController(text: title);
  }

  @override
  void dispose() {
    super.dispose();
    textContentController.dispose();
    textTitleController.dispose();
    title = "";
    content = "";
  }
}
