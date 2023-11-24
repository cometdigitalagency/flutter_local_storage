import 'package:flutter/material.dart';
import 'package:flutter_hive/all_notes_page.dart';
import 'package:flutter_hive/services/hive_database_service.dart';

void main() async {
  await HiveDatabaseService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const AllNotesPage(),
    );
  }
}
