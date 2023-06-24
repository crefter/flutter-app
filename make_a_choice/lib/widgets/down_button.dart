import 'package:flutter/material.dart';

import '../main.dart';
import 'left_box.dart';

class DownButton extends StatefulWidget {
  const DownButton({super.key});

  @override
  State<DownButton> createState() => _DownButtonState();
}

class _DownButtonState extends State<DownButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:
          Image.asset('assets/images/Снимок экрана 2023-06-17 в 03.14.30.png'),
      iconSize: 150,
      onPressed: () {
        print('press');

        setState(() {
          const LeftBoxAnimation();
        });
      },
    );
  }
}
