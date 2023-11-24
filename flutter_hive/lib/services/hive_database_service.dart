import 'package:flutter_hive/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabaseService {
  static initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NoteModelAdapter());

    // open boxes
    await Future.wait([Hive.openBox<NoteModel>('allNotes')]);
  }
}
