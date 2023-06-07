import 'package:bloc_example/color_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ColorBloc _bloc =
      ColorBloc(); // добавим блок в состояние нашего приложения

  @override // метод закрытие в стейте чтобы избежать утечки памяти
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc with streem'),
      ),
      body: Center(
        child: StreamBuilder(
            // AnimatedContainer  мы обернули в StreamBuilder чтобы виджет мог изменяться от потока стрим
            stream: _bloc
                .outputStateStream, // 3 параметра - 1 стрим - указать поток с данными выходными для этого бращаемся к перменной и вызываем гетер аут
            initialData: Colors.red, // по умолчаню цвет
            builder: (context,
                    snapshot) // данные от потока отрисовывает виджит и дальше возвращаем анимированный контроллер snapshot его укажем в цвете
                {
              return AnimatedContainer(
                // анимация находится в стрим билдере который подписан на поток из блока - при нажатии на кнопку
                height: 100,
                width: 100,
                color: snapshot
                    .data, // тут результат асинхронного вычисления snapshot - кадр , снимок экрана
                duration: const Duration(milliseconds: 500),
              );
            }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              _bloc.inputEventSink.add(ColorEvent.event_red);
            },
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              _bloc.inputEventSink.add(ColorEvent.event_green);
            },
          ),
        ],
      ),
    );
  }
}
