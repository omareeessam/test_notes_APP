import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nootees_app/cubits/notes_cubit/cubit/notes_cubit.dart';
import 'package:nootees_app/models/note_model.dart';
import 'package:nootees_app/widgets/custom_appbar.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title;
  String? content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
                text: 'Edit Notes',
                icon: IconButton(
                    onPressed: () {
                      widget.noteModel.title = title ?? widget.noteModel.title;
                      widget.noteModel.subtitle =
                          content ?? widget.noteModel.subtitle;
                      BlocProvider.of<NotesCubit>(context).fetchNote();
                      
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Edit Succesfuly',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center),
                        backgroundColor: Colors.blue,
                      ));
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.check))),
            SizedBox(
              height: 15,
            ),
            TextField(
              style: TextStyle(fontSize: 20, color: Colors.blue),
              maxLines: 1,
              onChanged: (value) {
                title = value;
              },
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.blue),
                hintText: widget.noteModel.title,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                content = value;
              },
              style: TextStyle(fontSize: 20, color: Colors.blue),
              maxLines: 6,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.blue),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: widget.noteModel.subtitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
