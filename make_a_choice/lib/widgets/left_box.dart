import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LeftBoxAnimation extends StatelessWidget {
  final VoidCallback onClicked;
  final bool isOpened;
  LeftBoxAnimation(
      {required this.onClicked, required this.isOpened, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedCrossFade(
        duration: const Duration(seconds: 1),
        crossFadeState:
            isOpened ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        firstChild: IconButton(
            icon: Image.asset('assets/images/b-box.png'),
            iconSize: 80,
            onPressed: () async {
              final db = FirebaseFirestore.instance;
              onClicked();
              await db.collection('prizes').get().then((event) {
                for (var doc in event.docs) {
                  print('${doc.id} => ${doc.data()}');
                }
              });
            }),
        secondChild: IconButton(
            icon: Image.asset('assets/images/b-box-o.png'),
            alignment: Alignment.centerLeft,
            iconSize: 150,
            onPressed: () {
              onClicked();
            }),
      ),
    );
  }
}
