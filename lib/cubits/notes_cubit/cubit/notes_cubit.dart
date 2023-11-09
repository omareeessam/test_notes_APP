import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nootees_app/const.dart';
import 'package:nootees_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  List<NoteModel>? filter;

  fetchNote() {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      notes = notesBox.values.toList();
      filter = notesBox.values.toList();
      emit(NotesSuccesss());
    } catch (e) {
      emit(NotesFailure(message: e.toString()));
    }
  }

  searchNote(String search) {
    filter = notes!.where((element) => element.title.contains(search)).toList();
    emit(NotesSuccesss());
  }
}
