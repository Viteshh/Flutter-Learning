import 'package:first_app/todolist/db_helper.dart';
import 'package:first_app/todolist/todo_model.dart';
import 'package:first_app/todolist/todo_screen.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  final Note? note;
  NotesScreen({Key? key, this.note}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  FocusNode? _focusNode = FocusNode();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (note != null) {
      titleController.text = note!.title;
      descriptionController.text = note!.description;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(note == null ? 'Add a note' : 'Edit note'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Center(
                  child: Text(
                    'What are you thinking about?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 35.0),
                    child: TextFormField(
                      // key: UniqueKey(),
                      // focusNode: _focusNode,
                      controller: titleController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                          hintText: 'Title',
                          labelText: 'Note title',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.75,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some title';
                        }
                        return null;
                      },
                    ),
                  ),
                  TextFormField(
                    // key: UniqueKey(),
                    // focusNode: _focusNode,
                    controller: descriptionController,
                    decoration: InputDecoration(
                        hintText: 'Type here the note',
                        labelText: 'Note description',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 0.75,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ))),
                    keyboardType: TextInputType.multiline,
                    onTap: () {},
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your daily task';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () async {
                        final title = titleController.text;
                        final description = descriptionController.text;
                        if (_formKey.currentState!.validate()) {
                          print("validate");
                          // form is valid, do something
                        } else {
                          // form is invalid, focus on the text field
                          _focusNode!.requestFocus();
                        }

                        if (title.isEmpty || description.isEmpty) {
                          return;
                        }

                        final Note model = Note(
                            title: title,
                            description: description,
                            id: note?.id);
                        if (note == null) {
                          await DatabaseHelper.addNote(model);
                        } else {
                          await DatabaseHelper.updateNote(model);
                        }

                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.white,
                                    width: 0.75,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  )))),
                      child: Text(
                        note == null ? 'Save' : 'Edit',
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
