import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/*
1) виды стандартных кнопок
2) обработка нажатий кнопки
3) обработка долгих нажатий кнопки
4) обновление состояния виджета при нажатии на кнопку
5) стили кнопок
6) контент кнопки: текст, иконки, другие элементы
*/

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  String text = 'Ни одна кнопка не нажата';

  void printFirst() {
    setState(() {
      text = 'Нажата или первая или вторая кнопка';
    });
  }

  void printSecond() {
    setState(() {
      text = 'Нажата третья кнопка';
    });
  }

  void printLast() {
    setState(() {
      text = 'Нажата последняя кнопка';
    });
  }

  void onLongPressPrint() {
    setState(() {
      text = 'Было долгое нажатие на одну из кнопкок';
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      // backgroundColor: MaterialStateProperty.all(Colors.red),
      // foregroundColor: MaterialStateProperty.all(Colors.black),
      // overlayColor: MaterialStateProperty.all(Colors.green),
      // shadowColor: MaterialStateProperty.all(Colors.red),
      // elevation: MaterialStateProperty.all(10),
      // padding: MaterialStateProperty.all(EdgeInsets.all(0)),
      // minimumSize: MaterialStateProperty.all(Size(100, 100)),
      // shape: MaterialStateProperty.all(
      //   RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(50.0),
      //     side: BorderSide(color: Colors.black),
      //   ),
      // ),
      // alignment: Alignment.topLeft,
    );

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(),
          Text(text),
          ElevatedButton(
            clipBehavior: Clip.hardEdge,
            style: style,
            onPressed: printFirst,
            onLongPress: onLongPressPrint,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.ac_unit),
                SizedBox(width: 10),
                Text('Нажми меня'),
                SizedBox(width: 10),
                Container(
                  color: Colors.red,
                ),
              ],
            ),
          ),
          OutlinedButton(
            clipBehavior: Clip.hardEdge,
            style: style,
            onPressed: printFirst,
            onLongPress: onLongPressPrint,
            child: Text('Нажми меня'),
          ),
          TextButton(
            clipBehavior: Clip.hardEdge,
            style: style,
            onPressed: printSecond,
            onLongPress: onLongPressPrint,
            child: Text('Нажми меня'),
          ),
          IconButton(
            splashRadius: 24,
            color: Colors.blue,
            splashColor: Colors.red,
            highlightColor: Colors.green,
            disabledColor: Colors.pink,
            onPressed: printLast,
            icon: Icon(Icons.ac_unit),
          )
        ],
      ),
    );
  }
}
