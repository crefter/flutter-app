import 'package:flutter/cupertino.dart';
import 'package:make_a_choice/widgets/time.dart';

class UpRowThreeWidgets extends StatelessWidget {
  const UpRowThreeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/4g.png", width: 100),
        // const SizedBox(
        //   width: 30,
        // ),
        const TimeWidget(),
        // const SizedBox(
        //   width: 30,
        // ),
        Image.asset("assets/images/tele2.png", width: 100),
      ],
    );
  }
}
