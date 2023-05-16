import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:weather_example_null_safety/models/weather_forecast_daily.dart';

import '../widgets/bottom_list_view.dart';

class ThetyScreen extends StatefulWidget {
  final WeatherForecast forecastObject;
  const ThetyScreen({super.key, required this.forecastObject});

  @override
  State<ThetyScreen> createState() => _ThetyScreenState();
}

class _ThetyScreenState extends State<ThetyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Погода на 3 дня'),
        centerTitle: true,
      ),
      body: BottomListView(snapshot: widget.forecastObject),
    );
  }
}
