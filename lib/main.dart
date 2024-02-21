import 'package:flutter/material.dart';
import 'package:notes_application/add_note.dart';
import 'package:notes_application/home.dart';
import 'package:notes_application/new/homepage.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AddNote(),
    );
  }
}
