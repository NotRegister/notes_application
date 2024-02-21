// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<NotesModel> welcomeFromJson(String str) => List<NotesModel>.from(json.decode(str).map((x) => NotesModel.fromJson(x)));

String welcomeToJson(List<NotesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotesModel {
    int id;
    String tag;
    String note;
    String username;
    DateTime createdAt;
    DateTime updatedAt;

    NotesModel({
        required this.id,
        required this.tag,
        required this.note,
        required this.username,
        required this.createdAt,
        required this.updatedAt,
    });

    factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
        id: json["id"],
        tag: json["tag"],
        note: json["note"],
        username: json["username"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tag": tag,
        "note": note,
        "username": username,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
