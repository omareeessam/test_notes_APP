
import 'package:flutter/material.dart';
import 'package:nootees_app/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CustomNoteitem();
      },
    );
  }
}
