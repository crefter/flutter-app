import 'package:flutter/material.dart';

class DownButton extends StatelessWidget {
  final VoidCallback onClicked;

  DownButton({required this.onClicked, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:
          Image.asset('assets/images/Снимок экрана 2023-06-17 в 03.14.30.png'),
      iconSize: 150,
      onPressed: () {
        print('press');
        onClicked();
      },
    );
  }
}
