import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({super.key});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  @override
  Widget build(BuildContext context) {
    // String datetime = DateTime.now().toString();
    String cdate = DateFormat("HH:mm").format(DateTime.now());
    return DefaultTextStyle(
      style: const TextStyle(
          color: Colors.white, fontSize: 30, fontStyle: FontStyle.normal),
      child: Text(
        cdate,
      ),
    );
  }
}
