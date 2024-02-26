import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notes_application/constant.dart';
import 'package:notes_application/notesModel.dart';

class ApiService {
  Future<List<NotesModel>?> getNotes(String loggedInUsername) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<NotesModel> _model = welcomeFromJson(response.body);
        List<NotesModel> filteredNotes = _model.where((note) => note.username == loggedInUsername).toList();
        return filteredNotes;
        // return _model;
      } else {
        log('Failed to load notes : ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteNote(int id) async {
    final response = await http.delete(Uri.parse('http://127.0.0.1:8000/api/notes/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete note');
    }
  }
}
