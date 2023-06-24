import 'package:flutter/material.dart';
import 'package:make_a_choice/widgets/down_button.dart';
import 'package:make_a_choice/widgets/left_box.dart';
import 'package:make_a_choice/widgets/right_box.dart';
import 'package:make_a_choice/widgets/up_row_three_widgets.dart';

import 'widgets/list.dart';
import 'widgets/text_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() {
    return MainScreenState();
  }
}

bool startPosition = false;

class MainScreenState extends State<MainScreen> {
  static const squareSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NerdFont'),
      home: const Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // можно использовать если на размеры на планшете не совпадают и можно верхнюю строчку не прилеплять к верху экрана
            children: [
              // UpRowThreeWidgets(),
              SizedBox(
                height: 80,
              ),
              TextUp(),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  LeftBoxAnimation(),
                  RightBoxAnimation(),
                ],
              ),
              DownButton(),
              ListDownScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
