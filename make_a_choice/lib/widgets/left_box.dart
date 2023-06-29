import 'package:flutter/material.dart';

class LeftBoxAnimation extends StatelessWidget {
  final List<String> listPrises;
  final VoidCallback onClicked;
  final bool isOpened;
  const LeftBoxAnimation(
      {required this.onClicked,
      required this.isOpened,
      super.key,
      required this.listPrises});

  @override
  Widget build(BuildContext context) {
    listPrises.shuffle();

    return Center(
      child: AnimatedCrossFade(
        duration: const Duration(seconds: 1),
        crossFadeState:
            isOpened ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        firstChild: IconButton(
            icon: Image.asset('assets/images/b-box.png'),
            iconSize: 180,
            onPressed: () {
              onClicked();
            }),
        secondChild: Stack(
          alignment: Alignment.centerRight,
          children: [
            IconButton(
                icon: Image.asset('assets/images/b-box-o.png'),
                alignment: Alignment.centerLeft,
                iconSize: 300,
                onPressed: () {
                  // onClicked();
                }),
            Padding(
              padding: const EdgeInsets.only(right: 30, top: 40),
              child: Text(listPrises.first,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.normal)),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondChild extends StatelessWidget {
  const SecondChild({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.asset('assets/images/b-box-o.png'),
        alignment: Alignment.centerLeft,
        iconSize: 150,
        onPressed: () {
          // onClicked();
        });
  }
}
