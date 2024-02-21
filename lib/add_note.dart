import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notes_application/api_service.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();

  Future<void> postNote() async {
    final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/notes/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: <String, dynamic>{
          'tag': 'Flutter HTTP CRUD',
          'note': 'test api through Flutter',
          'id': 1,
        });
  }
}

class _AddNoteState extends State<AddNote> {
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
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Add Note',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding:
                      const EdgeInsetsDirectional.only(start: 5, bottom: 10),
                  child: const Text(
                    'Notes Title',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  )),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Title',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  padding:
                      const EdgeInsetsDirectional.only(start: 5, bottom: 10),
                  child: const Text(
                    'Notes Content',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  )),
              const TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(),
                  hintText: 'Note',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.lightBlueAccent),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
