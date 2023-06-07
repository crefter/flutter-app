import 'package:hive_flutter/hive_flutter.dart';

class ExampleWidgetModel {
  examplewidaetModels() {
    Hive.initFlutter();
  }

  void doSome() async {
    var box = await Hive.openBox<dynamic>('testBox');
    final name = box.get('name') as String;
    print(name);
  }
}
