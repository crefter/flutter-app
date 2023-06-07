import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider<ColorProvider>.value(value: ColorProvider()),
      ], child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorProvider _state = Provider.of<ColorProvider>(context);
    final _color1 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    // CountProvider state = Provider.of<CountProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              color: _state._colorContainerRandom,
              duration: const Duration(milliseconds: 500),
              child: const SomeOtherWidget(),
            ),
            const SwitchExample(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

// setState( () {
//   _color = Colors.primaries[Random().nextInt(Colors.primaries.length)],
// })
class SomeOtherWidget extends StatelessWidget {
  const SomeOtherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      // child: SwitchExample(),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    ColorProvider _state1 = Provider.of<ColorProvider>(context);
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: Colors.red,
      onChanged: () => _state1._colorContainerRandom;
        // setState(() {
        //   light = value;
        // });
      
    );
  }
}

class ColorProvider extends ChangeNotifier {
  var _colorContainerRandom = Colors.red;
  get CountValue => _colorContainerRandom;

  void _colorContainer() {
    final _colorContainerRandom =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    notifyListeners();
  }

  void _colorTitle() {
    final _colorTitleRandom =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    notifyListeners();
  }
}
