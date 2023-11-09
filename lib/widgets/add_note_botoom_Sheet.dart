import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nootees_app/cubits/add_note/add_note_cubit.dart';
import 'package:nootees_app/cubits/notes_cubit/cubit/notes_cubit.dart';
import 'package:nootees_app/widgets/add_note_form.dart';

class AddNoteBotoomSheet extends StatefulWidget {
  const AddNoteBotoomSheet({super.key});

  @override
  State<AddNoteBotoomSheet> createState() => _AddNoteBotoomSheetState();
}

class _AddNoteBotoomSheetState extends State<AddNoteBotoomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            if (kDebugMode) {
              print('error failed ${state.message}');
            }
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchNote();

            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                top: 15,
                right: 15,
                left: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(child: AddNoteForm()),
            ),
          );
        },
      ),
    );
  }
}
