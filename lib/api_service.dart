import 'dart:developer';

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

  //http put update
/*   Future<void> updateNote(int id, String tag, String note) async {
    Map<String,dynamic> request = [
      'id' = "14", 

    ]
    
  } */
}
