import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_example_null_safety/bloc/weather_bloc.dart';
import 'package:weather_example_null_safety/screens/first_screen.dart';

/*
Приложение погода 
на 1 экране ввод города
на 2 показывается температура влажность и скорость ветра
на 3 прогноз на 3 дня

в качестве StateManagment использую Bloc
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherBloc(),
      child: const MaterialApp(
        home: FirstScreen(),
      ),
    );
  }
}
