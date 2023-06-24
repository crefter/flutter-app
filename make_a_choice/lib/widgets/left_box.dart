import 'package:flutter/material.dart';
import 'package:make_a_choice/main.dart';

class LeftBoxAnimation extends StatefulWidget {
  const LeftBoxAnimation({super.key});

  @override
  State<LeftBoxAnimation> createState() => _LeftBoxAnimationState();
}

class _LeftBoxAnimationState extends State<LeftBoxAnimation> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(seconds: 1),
      crossFadeState:
          value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: IconButton(
          icon: Image.asset('assets/images/b-box.png'),
          iconSize: 80,
          onPressed: () {
            setState(() {
              value = !value;

              // startPosition = false;
            });
          }),
      secondChild: IconButton(
          icon: Image.asset('assets/images/b-box-o.png'),
          alignment: Alignment.centerLeft,
          iconSize: 150,
          onPressed: () {}),
    );
  }
}
