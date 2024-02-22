import 'package:flutter/material.dart';
import 'package:notes_application/screens/home.dart';

class PreviewNote extends StatefulWidget {
  const PreviewNote({super.key});

  @override
  State<PreviewNote> createState() => _PreviewNoteState();
}

class _PreviewNoteState extends State<PreviewNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          title: const Text(
            'Preview Note',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightBlueAccent,
        ),
    );
  }
} 