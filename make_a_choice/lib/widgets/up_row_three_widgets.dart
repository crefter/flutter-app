import 'package:flutter/cupertino.dart';
import 'package:make_a_choice/widgets/time.dart';

class UpRowThreeWidgets extends StatelessWidget {
  const UpRowThreeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/Снимок экрана 2023-06-16 в 17.20.08.png",
            width: 100),
        const SizedBox(
          width: 30,
        ),
        const TimeWidget(),
        const SizedBox(
          width: 30,
        ),
        Image.asset("assets/images/Снимок экрана 2023-06-16 в 17.53.05.png",
            width: 100),
      ],
    );
  }
}
