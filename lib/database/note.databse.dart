import 'package:notes/entities/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteDatabase {
  static final NoteDatabase instance = NoteDatabase._init();
  static Database? _database;
  final String createDB = '''
    CREATE TABLE notes(
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    title TEXT NOT NULL,
    content TEXT NOT NULL)''';

  NoteDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDataBase('notes.db');
    return _database!;
  }

  Future<Database> _initDataBase(String filePath) async {
    final daPath = await getDatabasesPath();
    final path = join(daPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreateBD);
  }

  Future<void> _onCreateBD(Database db, int version) async {
    await db.execute(createDB);
  }

  Future<int> create(Note note) async {
    final db = await instance.database;
    return await db.insert('notes', note.toJson());
  }

  Future<List<Note>> readAll() async {
    final db = await instance.database;
    final result = await db.query('notes');
    return result.map((json) => Note.fromJson(json)).toList();
  }
}
