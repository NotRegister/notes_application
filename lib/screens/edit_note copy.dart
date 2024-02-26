import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:notes_application/notesModel.dart';
import 'package:notes_application/screens/home.dart';

class EditNoteC extends StatefulWidget {
  final NotesModel notesModel;

  const EditNoteC({Key? key, required this.notesModel}) : super(key: key);

  @override
  State<EditNoteC> createState() => _EditNoteState(this.notesModel);
}

class _EditNoteState extends State<EditNoteC> {
  final NotesModel notesModel;
  _EditNoteState(this.notesModel);

  final titleController = TextEditingController();
  final noteController = TextEditingController();
  String todayDate = DateFormat('yMd').format(DateTime.now());

  // @override
  // void dispose() {
  //   titleController.dispose();
  //   noteController.dispose();
  //   super.dispose();
  // }

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
          'Edit Note',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            TextField(
              controller: titleController..text = notesModel.tag,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                hintText: 'write your note title',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.lightBlueAccent,
                  ),
                ),
                fillColor: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsetsDirectional.only(start: 5, bottom: 10),
              child: const Text(
                'Notes Content',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            TextField(
              controller: noteController..text = notesModel.note,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                hintText: 'write your note',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.lightBlueAccent,
                  ),
                ),
                fillColor: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.lightBlueAccent,
                minimumSize: const Size(double.infinity, 60),
              ),
              onPressed: () async {
                try {
                  final url =
                      Uri.parse('http://127.0.0.1:8000/api/notes/${notesModel.id}');
                  final response = await http.post(
                    url,
                    // headers: <String, String>{
                    //   'Content-Type': 'application/json; charset=UTF-8',
                    // },
                    body: {
                      'tag': titleController.text,
                      'note': noteController.text,
                    },
                  );

                  if (response.statusCode == 200) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  } else {
                    print('Failed to update data: ${response.statusCode}');
                    // Print the response body for more information if needed
                    print('Response Body: ${response.body}');
                  }
                } catch (e) {
                  print('Error: $e');
                }
              },
              child: const Text(
                'Edit',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
