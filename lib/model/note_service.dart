// import 'package: flutter/model/note.dart';
import 'dart:convert';
import 'package:notes_application/model/note.dart';
import '../network/api.dart';

class NoteService {
  String baseUrl = "/notes";

  Future<List<Note>> getNotes() async {
    final response = await Network().getData(baseUrl);
    List<Note> list = parseResponse(response.body);
    return list;
  }

  List<Note> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Note>((json) => Note.fromJson(json)).toList();
  }
}
