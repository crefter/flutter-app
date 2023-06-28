import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:make_a_choice/widgets/down_button.dart';
import 'package:make_a_choice/widgets/left_box.dart';
import 'package:make_a_choice/widgets/right_box.dart';
import 'package:firebase_core/firebase_core.dart';
import 'widgets/text_up.dart';
import 'widgets/up_row_three_widgets.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //   apiKey: 'AIzaSyA1v1QYGiuJRGU7Wn_TvzGE4-rzKn2KXcE',
  //   appId: '1:1087427642123:android:0cc807f5016fd8dc02d80e',
  //   messagingSenderId: '1087427642123',
  //   projectId: 'tele2-dd7a8',
  //   storageBucket: 'tele2-dd7a8.appspot.com',
  // ));
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

class MainScreenState extends State<MainScreen> {
  static const squareSize = 50.0;
  late bool isOpenedLeft;
  late bool isOpenedRight;

  @override
  void initState() {
    super.initState();
    isOpenedLeft = false;
    isOpenedRight = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NerdFont'),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('prizes').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Text(
                    'Нет записей',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  );
                }
                return Column(
                  // mainAxisSize: MainAxisSize.max,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // можно использовать если на размеры на планшете не совпадают и можно верхнюю строчку не прилеплять к верху экрана
                  children: [
                    const UpRowThreeWidgets(),
                    const SizedBox(
                      height: 80,
                    ),
                    const TextUp(
                        // toggle: true,
                        ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: LeftBoxAnimation(
                            onClicked: () {
                              isOpenedLeft = !isOpenedLeft;
                              setState(() {});
                            },
                            isOpened: isOpenedLeft,
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: RightBoxAnimation(
                            onClicked: () {
                              isOpenedRight = !isOpenedRight;
                              setState(() {});
                            },
                            isOpened: isOpenedRight,
                          ),
                        ),
                      ],
                    ),
                    DownButton(
                      onClicked: () {
                        if (isOpenedLeft || isOpenedRight) {
                          isOpenedLeft = false;
                          isOpenedRight = false;
                          setState(() {});
                        }
                      },
                    ),
                    // const ListDownScreen(),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
