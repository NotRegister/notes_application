import 'package:flutter/material.dart';
import 'package:notes_application/constant.dart';
import 'package:notes_application/notesModel.dart';
import 'package:notes_application/api_service.dart';
import 'package:notes_application/update_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<NotesModel>? _notesModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _notesModel = (await ApiService().getNotes())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catatan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: UpdateNote()))
        },
      ),
      body: _notesModel == null || _notesModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _notesModel!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _notesModel![index].tag,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Column(
                                    children: [
                                      Text(_notesModel![index].note),
                                    ],
                                  ),
                                ],
                              ),
                              ButtonBar(children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.amber,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    var apiService = ApiService();
                                    apiService
                                        .deleteNote(_notesModel![index].id);
                                    setState(() {
                                      // _getData();
                                      // _notesModel!.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ])
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ,
    );
  }
}
