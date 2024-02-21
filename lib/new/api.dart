import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> _fetchData() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/notes'));

  if (response.statusCode != 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<void> _createData() async {
  try {
    final response =
        await http.post(Uri.parse('http://127.0.0.1:8000/api/posts'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              'tag': 'Flutter HTTP CRUD',
              'note': 'This is a blog post about HTTP CRUD methods in Flutter',
              'id': 1,
            }));

    if (response.statusCode == 201) {
      _fetchData();
    } else {
      throw Exception('Failed to create data');
    }
  } catch (e) {
    print(e);
  }
}

Future _updateData(int id) async {
  try {
    final response =
        await http.put(Uri.parse('http://127.0.0.1:8000/api/posts/$id'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              'tag': 'Flutter HTTP CRUD',
              'note': 'new note',
            }));
    if (response.statusCode == 201) {
      _fetchData();
    } else {
      throw Exception('Failed to create data');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> _deleteData(int id) async {
    try {
      final response = await http.delete(Uri.parse('http://127.0.0.1:8000/api/posts/$id'));
      if (response.statusCode == 200) {
        _fetchData();
      } else {
        throw Exception('Failed to delete data');
      }
    } catch (error) {
      print(error);
    }
  }
