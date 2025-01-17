import 'package:flutter/material.dart';
import 'package:make_a_choice/widgets/down_button.dart';
import 'package:make_a_choice/widgets/left_box.dart';
import 'package:make_a_choice/widgets/parse_remote_datasourse.dart';
import 'package:make_a_choice/widgets/right_box.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'widgets/text_up.dart';
import 'widgets/up_row_three_widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const keyApplicationId = '5uFjH3WOFMWNxDqjMuBq7vZArsfOQsoxxhGMpTYL';
  const keyClientKey = 'aGWlndUmFRjfy716EPmCXGmikfYG5I2lrPOUglvd';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static const squareSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NerdFont'),
      home: FutureBuilder<List<String>>(
          future: _getListPrises(),
          initialData: const [],
          builder: (context, snapshot) {
            return snapshot.data!.isNotEmpty
                ? HomeScreen(
                    listPrises: snapshot.data!,
                  )
                : const SizedBox.shrink();
          }),
    );
  }

  Future<List<String>> _getListPrises() async {
    return await ParseRemoteDatasource().getAllPrises();
  }
}

class HomeScreen extends StatefulWidget {
  final List<String> listPrises;

  const HomeScreen({required this.listPrises, Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // можно использовать если на размеры на планшете не совпадают и можно верхнюю строчку не прилеплять к верху экрана
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
                  width: 100,
                  height: 100,
                  child: LeftBoxAnimation(
                    onClicked: () {
                      isOpenedLeft = !isOpenedLeft;
                      setState(() {});
                    },
                    isOpened: isOpenedLeft,
                    listPrises: widget.listPrises,
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: RightBoxAnimation(
                    onClicked: () {
                      isOpenedRight = !isOpenedRight;
                      setState(() {});
                    },
                    isOpened: isOpenedRight,
                    listPrises: widget.listPrises,
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
                  widget.listPrises.shuffle();
                }
              },
            ),
            // const ListDownScreen(),
          ],
        ),
      ),
    );
  }
}
