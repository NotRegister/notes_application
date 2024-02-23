import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notes_application/constant.dart';
import 'package:notes_application/notesModel.dart';

class ApiService {
  Future<List<NotesModel>?> getNotes() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<NotesModel> _model = welcomeFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> deleteNote(int id) async {
    final response =
        await http.delete(Uri.parse('http://127.0.0.1:8000/api/notes/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete note');
    }
  }

  Future<void> postNote(String tag, String note) async {
    final response =
        await http.post(Uri.parse('http://127.0.0.1:8000/api/notes/'),
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