import 'package:flutter/material.dart';
import 'package:notes_application/add_note.dart';
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
      floatingActionButton: FloatingActionButton.large(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddNote()),
        ),
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: _notesModel == null || _notesModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 120),
              child: ListView.builder(
                  itemCount: _notesModel!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SingleChildScrollView(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _notesModel![index].tag,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        _notesModel![index].note,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () async {},
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        var apiService = ApiService();
                                        apiService
                                            .deleteNote(_notesModel![index].id);
                                        setState(() {
                                          // _getData();f
                                          _notesModel!.removeAt(index);
                                        });
                                        // print('setstate error');
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
