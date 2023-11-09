import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.autovalidateMode,
      this.onPressed,
      required this.isLoding});
  AutovalidateMode autovalidateMode;
  final void Function()? onPressed;
  final bool isLoding;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(500))),
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: isLoding
            ? CircularProgressIndicator(
                color: Colors.black,
              )
            : Text(
                'add',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
      ),
    );
  }
}
