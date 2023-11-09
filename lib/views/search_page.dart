import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nootees_app/cubits/notes_cubit/cubit/notes_cubit.dart';
import 'package:nootees_app/models/note_model.dart';
import 'package:nootees_app/widgets/custom_note_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? search;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  search = value;
                  BlocProvider.of<NotesCubit>(context).searchNote(search!);
                },
                decoration: InputDecoration(
                    labelText: 'search', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: BlocBuilder<NotesCubit, NotesState>(
                  builder: (context, state) {
                    List<NoteModel> myList =
                        BlocProvider.of<NotesCubit>(context).filter!;
                    return ListView.builder(
                      itemCount: myList.length,
                      itemBuilder: (context, index) {
                        return CustomNoteitem(noteModel: myList[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
