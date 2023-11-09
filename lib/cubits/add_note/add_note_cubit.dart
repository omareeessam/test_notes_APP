import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nootees_app/const.dart';
import 'package:nootees_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = const Color(0xffFFC436);

  addNote(NoteModel noteModel) async {
    noteModel.color = color.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(noteModel);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(message: e.toString()));
    }
  }
}
