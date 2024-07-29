import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/screens/controller/note.controller.dart';
import 'package:notes/screens/note_create.screen.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late NoteController _noteController;

  @override
  void initState() {
    _noteController = NoteController();
    _noteController.readAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de notas',
          style: TextStyle(color: Colors.white38),
        ),
        backgroundColor: Colors.black,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: _noteController.notes.length,
          itemBuilder: (context, index) {
            final note = _noteController.notes[index];
            return ListTile(
              title: Text(note.title),
              subtitle: Text(note.content),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const NoteCreateScreen()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.red,
        ),
      ),
    );
  }
}
