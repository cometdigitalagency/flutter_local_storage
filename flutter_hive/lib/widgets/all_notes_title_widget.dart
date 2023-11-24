import 'package:flutter/material.dart';

class AllNotesTitleWidget extends StatelessWidget {
  const AllNotesTitleWidget({super.key, required this.quantity});
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'All notes',
            style: TextStyle(fontSize: 36),
          ),
        ),
        Center(
          child: Text(
            '$quantity notes',
            style: const TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
