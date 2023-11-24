import 'package:flutter/material.dart';

import '../models/note_model.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key, required this.note, required this.delete});

  final NoteModel note;
  final Function() delete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: const Color(0xffbb86fc),
                borderRadius: BorderRadius.circular(12)),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      note.content,
                      softWrap: true,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                trailing: IconButton(
                    onPressed: delete,
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    )),
              ),
            )),
        Text(note.createdDate.toString().substring(0, 10)),
      ],
    );
  }
}
