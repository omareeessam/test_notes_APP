import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
   CustomAppbar({super.key, required this.text, required this.icon, });
  final String text;
  final IconButton icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 30),
          ),
          Spacer(),
          IconButton(onPressed: () {}, icon: icon)
        ],
      ),


    );
  }
}
