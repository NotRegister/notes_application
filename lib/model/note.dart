// import 'package:flutter/material.dart';

class Note {
  int id;
  String tag, note, username, createdAt, updatedAt;

  Note(
      {required this.id,
      required this.note,
      required this.username,
      required this.createdAt,
      required this.updatedAt,
      required this.tag});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
        id: json['id'],
        tag: json['tag'],
        note: json['note'],
        username: json['username'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }
}
