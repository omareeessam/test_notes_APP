import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nootees_app/cubits/add_note/add_note_cubit.dart';
import 'package:nootees_app/cubits/notes_cubit/cubit/notes_cubit.dart';

class CutomListCircle extends StatefulWidget {
  const CutomListCircle({super.key});

  @override
  State<CutomListCircle> createState() => _CutomListCircleState();
}

class _CutomListCircleState extends State<CutomListCircle> {
  int currentInidex = 0;

  List<Color> colorrr = const [
    Color.fromARGB(255, 124, 197, 237),
    Color(0xff39A7FF),
    Color(0xffFFEED9),
    Color(0xff87C4FF),
    Color(0xffFFC436),
    Color(0xffB0926A),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
    
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colorrr.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  currentInidex = index;
                  BlocProvider.of<AddNoteCubit>(context).color = colorrr[index];
                  setState(() {});
                },
                child: CustomCircleAvatarr(
                  color: colorrr[index],
                  isActive: currentInidex == index,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CustomCircleAvatarr extends StatelessWidget {
  const CustomCircleAvatarr(
      {super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 25,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 28,
          );
  }
}
