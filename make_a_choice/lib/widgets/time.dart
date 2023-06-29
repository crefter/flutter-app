// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class TimeWidget extends StatefulWidget {
//   const TimeWidget({super.key});

//   @override
//   State<TimeWidget> createState() => _TimeWidgetState();
// }

// class _TimeWidgetState extends State<TimeWidget> {
//   @override
//   Widget build(BuildContext context) {
//     // String datetime = DateTime.now().toString();
//     String cdate = DateFormat("HH:mm").format(DateTime.now());
//     return DefaultTextStyle(
//       style: const TextStyle(
//           color: Colors.white, fontSize: 30, fontStyle: FontStyle.normal),
//       child: Text(
//         cdate,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 10)),
      builder: (context, snapshot) {
        return Text(
            style: const TextStyle(
                color: Colors.white, fontSize: 36, fontStyle: FontStyle.normal),
            DateFormat('HH:mm').format(DateTime.now()));
      },
    );
  }
}
