import 'package:flutter/material.dart';
import 'package:flutter_hive/add_new_note.dart';
import 'package:flutter_hive/models/note_model.dart';
import 'package:flutter_hive/widgets/all_notes_title_widget.dart';
import 'package:flutter_hive/widgets/note_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AllNotesPage extends StatefulWidget {
  const AllNotesPage({super.key});

  @override
  State<AllNotesPage> createState() => _AllNotesPageState();
}

class _AllNotesPageState extends State<AllNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 8, right: 8),
              child: ValueListenableBuilder(
                  valueListenable: Hive.box<NoteModel>('allNotes').listenable(),
                  builder: (context, box, builder) {
                    return Column(
                      children: [
                        AllNotesTitleWidget(quantity: box.length),
                        Expanded(
                            child: ListView.builder(
                                padding: const EdgeInsets.only(bottom: 12),
                                itemCount: box.values.length,
                                itemBuilder: (context, index) {
                                  NoteModel note = box.values.toList()[index];
                                  return NoteWidget(
                                    note: note,
                                    delete: () async {
                                      await box.deleteAt(index);
                                    },
                                  );
                                })),
                      ],
                    );
                  }))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNewNote()));
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
