import 'package:flutter/material.dart';
import 'package:notes/entities/note.dart';
import 'package:notes/screens/controller/note.controller.dart';
import 'package:notes/screens/note.screen.dart';


class NoteCreateScreen extends StatefulWidget {
  const NoteCreateScreen({super.key});

  @override
  State<NoteCreateScreen> createState() => _NoteCreateScreenState();
}

class _NoteCreateScreenState extends State<NoteCreateScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late NoteController _noteController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    _noteController = NoteController();
    super.initState();
  }

  _saveNote() {
    final note = Note(title: _titleController.text, content: _contentController.text);
    _noteController.createOne(note);
    Navigator.push(context, MaterialPageRoute(builder: (context) => const NoteScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Nota')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: 'Conteudo',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveNote(),
              child: const Text('Salvar Nota'),
            ),
          ],
        ),
      ),
    );
  }
}
