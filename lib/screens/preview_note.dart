import 'package:flutter/material.dart';
import 'package:notes_application/notesModel.dart';
import 'package:notes_application/screens/home.dart';
import 'package:http/http.dart' as http;


class PreviewNote extends StatefulWidget {
  final NotesModel notesModel;
  
  const PreviewNote({super.key, required this.notesModel});

  @override
  State<PreviewNote> createState() => _PreviewNoteState(this.notesModel);
}

class _PreviewNoteState extends State<PreviewNote> {
  final NotesModel notesModel;
  _PreviewNoteState(this.notesModel);
  
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
              Navigator.pop(context);
            },
          ), 
          title: const Text(
            'Preview Note',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsetsDirectional.only(start: 5, bottom: 10),
                      child: const Text(
                        'Notes Title',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                    Text(
                      notesModel.tag,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.only(start: 5, bottom: 10),
                      child: const Text(
                        'Notes',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                    Text(
                      notesModel.note,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.only(start: 5, bottom: 10),
                      child: const Text(
                        'Date',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                    ),
                    Text(
                      notesModel.createdAt.toUtc().toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
} 