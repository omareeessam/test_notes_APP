import 'package:flutter/material.dart';
import 'package:nootees_app/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  @override
  final data = const[
  Colors.deepOrangeAccent,
  Colors.amber,
  ];
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return CustomNoteitem();
      },
    );
  }
}
