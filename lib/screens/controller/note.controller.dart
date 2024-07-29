import 'package:get/get.dart';
import 'package:notes/database/note.databse.dart';
import 'package:notes/entities/note.dart';

class NoteController extends GetxController {
  final Rx<List<Note>> _notes = Rx([]);
  final dbInstance = NoteDatabase.instance;

  NoteController();

  List<Note> get notes => _notes.value;

  void setNotes(List<Note> value) => _notes.value = value;

  Future<void> readAll() async {
    setNotes(await dbInstance.readAll());
  }

  Future<void> createOne(Note note) async {
    final result = await dbInstance.create(note);
    if (result > 0) {
      readAll();
    }
  }
}
