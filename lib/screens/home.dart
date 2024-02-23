import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_application/notesModel.dart';
import 'package:notes_application/api_service.dart';
import 'package:notes_application/screens/add_note.dart';
import 'package:notes_application/screens/edit_note%20copy.dart';
import 'package:notes_application/screens/edit_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<NotesModel>? _notesModel = [];

  void _getData() async {
    _notesModel = (await ApiService().getNotes())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Scaffold(
        /*appBar: AppBar(
           title: const Text(
            'Catatan',
            style: TextStyle(color: Colors.white),
          ), 
          backgroundColor: Colors.lightBlueAccent,
        ),*/
        floatingActionButton: FloatingActionButton(
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: _notesModel == null || _notesModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 0, bottom: 0),
                    child: Text('You\nHave\n${_notesModel!.length} Notes',
                        style: GoogleFonts.poppins(color: Colors.black87, fontSize: 55)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 280,
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
                                        width: MediaQuery.of(context).size.width - 200,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                              style: const TextStyle(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => EditNoteC(notesModel: _notesModel![index])
                                                        /*  (context) => EditNote(
                                                            id: _notesModel![index].id,
                                                            tag: _notesModel![index].tag,
                                                            note:_notesModel![index].note,
                                                          ) */));
                                            },
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
                                                // _getData();
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
                ],
              ),
      ),
    );
  }
}
