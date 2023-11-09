import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nootees_app/cubits/notes_cubit/cubit/notes_cubit.dart';
import 'package:nootees_app/models/note_model.dart';
import 'package:nootees_app/widgets/custom_note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchNote(); 
  }

  @override
  Widget build(BuildContext context) {
     List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes!;
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: notes.length,
          itemBuilder: (context, index) {
         return   CustomNoteitem(noteModel: notes[index]);
          },
        );
      },
    );
  }
}
