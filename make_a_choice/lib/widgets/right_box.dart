import 'package:flutter/material.dart';

import '../main.dart';

class RightBoxAnimation extends StatefulWidget {
  const RightBoxAnimation({super.key});

  @override
  State<RightBoxAnimation> createState() => _RightBoxAnimationState();
}

class _RightBoxAnimationState extends State<RightBoxAnimation> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(seconds: 1),
      crossFadeState:
          value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: IconButton(
          icon: Image.asset('assets/images/p-box.png'),
          iconSize: 80,
          onPressed: () {
            setState(() {
              value = !value;
              startPosition = false;
            });
          }),
      secondChild: IconButton(
          icon: Image.asset('assets/images/p-box-o.png'),
          iconSize: 150,
          onPressed: () {}),
    );
  }
}
