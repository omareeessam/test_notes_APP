import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('notes app'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(20),
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
                    'data adafad ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
//  body: Container(
//         margin: EdgeInsets.all(15),
//         padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.amber,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         height: 200,
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   'data adafad ',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 Spacer(),
//                 Icon(
//                   Icons.delete,
//                   size: 28,
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     'buid inss idjr dins mkkf inss idjrinss idkf  mkkf inss idjrinss idkf  mkkf inss idjrinss idkf   mkkf inss idjrinss idkf  idkf  idkf idkf idkf idkf',
//                     maxLines: 50,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(color: Colors.black.withOpacity(.5)),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   'may 5/12/1999 ',
//                   style: TextStyle(color: Colors.black.withOpacity(.5)),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),