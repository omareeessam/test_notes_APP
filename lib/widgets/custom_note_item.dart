import 'package:flutter/material.dart';

class CustomNoteitem extends StatelessWidget {
  const CustomNoteitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.amber,
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
                const Text(
                  'omar elomda ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    's idjr dins mkkf inss kf inss kf inss kf ins',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black.withOpacity(.7)),
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
                onPressed: () {},
              ),
              const Spacer(),
              Text(
                'may 5/12/1999 ',
                style: TextStyle(color: Colors.black.withOpacity(.5)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
