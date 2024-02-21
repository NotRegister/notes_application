import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateNote extends StatefulWidget {
  Map<String, dynamic> note;
  UpdateNote({Key? key, required this.note}) : super(key: key);

  @override
  State<UpdateNote> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UpdateNote> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
