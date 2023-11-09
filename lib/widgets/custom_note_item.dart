import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nootees_app/cubits/notes_cubit/cubit/notes_cubit.dart';
import 'package:nootees_app/models/note_model.dart';
import 'package:nootees_app/views/edit_note_view.dart';

class CustomNoteitem extends StatelessWidget {
  const CustomNoteitem({
    super.key,
    required this.noteModel,
  });
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNoteView(noteModel: noteModel),
          )),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color:Color(noteModel.color),
          borderRadius: BorderRadius.circular(15),
        ),
        height: 200,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noteModel.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Text(
                      noteModel.subtitle,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20, color: Colors.black.withOpacity(.7)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 28,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    noteModel.delete();
                    BlocProvider.of<NotesCubit>(context).fetchNote();
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                const Spacer(),
                Text(
                  noteModel.date,
                  style: TextStyle(color: Colors.black.withOpacity(.5)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
