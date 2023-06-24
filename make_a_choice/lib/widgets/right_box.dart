import 'package:flutter/material.dart';

class RightBoxAnimation extends StatelessWidget {
  final VoidCallback onClicked;
  final bool isOpened;
  RightBoxAnimation({required this.onClicked, required this.isOpened, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(seconds: 1),
      crossFadeState:
      isOpened ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      firstChild: IconButton(
          icon: Image.asset('assets/images/p-box.png'),
          iconSize: 80,
          onPressed: () {
            onClicked();
          }),
      secondChild: IconButton(
          icon: Image.asset('assets/images/p-box-o.png'),
          iconSize: 150,
          onPressed: () {
            onClicked();
          }),
    );
  }
}
