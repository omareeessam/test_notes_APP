import 'package:flutter/material.dart';
import 'package:nootees_app/widgets/custom_appbar.dart';
import 'package:nootees_app/widgets/custom_note_item.dart';
import 'package:nootees_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          CustomAppbar(),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
