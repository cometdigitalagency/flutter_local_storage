import 'package:flutter/material.dart';
import 'package:flutter_hive/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddNewNote extends StatelessWidget {
  const AddNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    // ປະກາດຕົວປ່ຽນ box ເພື່ອໃຊ້ເກັບ box allNotes.
    final box = Hive.box<NoteModel>('allNotes');

    void saveNote() async {
      if (titleController.text != '' && contentController.text != '') {
        await box
            .add(NoteModel(
                title: titleController.text,
                content: contentController.text,
                createdDate: DateTime.now()))
            .then((_) => Navigator.pop(context));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('New note'),
        actions: [
          TextButton(
              onPressed: () => saveNote(),
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              autofocus: true,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(fontSize: 26),
              ),
            ),
            Expanded(
                child: TextField(
              controller: contentController,
              style: const TextStyle(fontSize: 20),
              expands: true,
              minLines: null,
              maxLines: null,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Type here'),
            )),
          ],
        ),
      ),
    );
  }
}
