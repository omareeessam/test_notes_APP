import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nootees_app/cubits/add_note/add_note_cubit.dart';
import 'package:nootees_app/cubits/notes_cubit/cubit/notes_cubit.dart';
import 'package:nootees_app/models/note_model.dart';
import 'package:nootees_app/widgets/color_list.dart';
import 'package:nootees_app/widgets/custom_button.dart';
import 'package:nootees_app/widgets/cutom_Text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title;
  String? subTitle;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                maxlines: 1,
                hintText: 'title',
                onsaved: (p0) {
                  title = p0;
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                maxlines: 4,
                hintText: 'content',
                onsaved: (p0) {
                  subTitle = p0;
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 60,
                child: CutomListCircle(),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<AddNoteCubit, AddNoteState>(
                  builder: (context, state) {
                return CustomButton(
                  isLoding: state is AddNoteLoading ? true : false,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var currentDate = DateTime.now();
                      var formatedDate = DateFormat.yMd().format(currentDate);
                      var note = NoteModel(
                          title: title!,
                          subtitle: subTitle!,
                          date: formatedDate,
                          color: BlocProvider.of<AddNoteCubit>(context)
                              .color
                              .value);
                      BlocProvider.of<AddNoteCubit>(context).addNote(note);
                      BlocProvider.of<NotesCubit>(context).fetchNote();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  autovalidateMode: AutovalidateMode.always,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
