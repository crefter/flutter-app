import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_example_null_safety/bloc/weather_bloc.dart';
import 'package:weather_example_null_safety/screens/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
