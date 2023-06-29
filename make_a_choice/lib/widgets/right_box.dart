import 'package:flutter/material.dart';

class RightBoxAnimation extends StatelessWidget {
  final VoidCallback onClicked;
  final List<String> listPrises;
  final bool isOpened;
  const RightBoxAnimation(
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
            icon: Image.asset('assets/images/p-box.png'),
            iconSize: 180,
            onPressed: () {
              onClicked();
            }),
        secondChild: Stack(
          alignment: Alignment.centerLeft,
          children: [
            IconButton(
                icon: Image.asset('assets/images/p-box-o.png'),
                iconSize: 280,
                onPressed: () {}),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 40),
              child: Text(
                listPrises.last,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
