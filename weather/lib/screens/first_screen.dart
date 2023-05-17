import 'package:flutter/material.dart';
import 'package:weather_example_null_safety/screens/second_screen.dart';

/*
первый экран - решил использовать стиль минимализма 

для корректного отображения приложения все обернул в SafeArea
для перехода между страницами используем стандартный Navigator с методами pop push
так как мало страниц и стек не будет большим - на этом тут можно закончить.
*/
class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тестовое задание погода'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: ('Введите название города'),
                hintText: "Москва,Санкт-Петербург,Краснодар,Казань....",
                filled: true,
              ),
              onChanged: (value) {
                cityName = value;
              },
            ),
            ElevatedButton(
              child: const Text(
                'Подтвердить',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SecondScreen(cityName: cityName);
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
