import 'package:flutter/material.dart';

class DownButton extends StatelessWidget {
  final VoidCallback onClicked;

  DownButton({required this.onClicked, super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/clear.png'),
      iconSize: 250,
      onPressed: () {
        // print('press');
        onClicked();
//  listPrises.shuffle();
      },
    );
  }
}
