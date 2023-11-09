import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nootees_app/cubits/notes_cubit/cubit/notes_cubit.dart';
import 'package:nootees_app/views/search_page.dart';
import 'package:nootees_app/widgets/add_note_botoom_Sheet.dart';
import 'package:nootees_app/widgets/custom_appbar.dart';
import 'package:nootees_app/widgets/custom_note_item.dart';
import 'package:nootees_app/widgets/notes_list_view.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchNote();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                context: context,
                builder: (context) {
                  return AddNoteBotoomSheet();
                },
              );
            },
          ),
          body: SafeArea(
            child: Column(
              children: [
                CustomAppbar(
                    text: 'Notes',
                    icon: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchPage(),
                              ));
                        },
                        icon: Icon(Icons.search))),
                Expanded(child: NotesListView()),
              ],
            ),
          ),
        );
      },
    );
  }
}
