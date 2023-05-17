import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_example_null_safety/bloc/weather_bloc.dart';
import 'package:weather_example_null_safety/screens/first_screen.dart';

/*
Приложение погода было написано за 3 дня 
скажу сразу чтобы не просто)
несолько раз возникали проблемы с самой средой VSCode ошибки типа podfile.lock
потом с гитхабом но позже все заработало
само приложение не стал украшать никак так как на это нужно было время 
делал все быстро без анимаций и иконок
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
