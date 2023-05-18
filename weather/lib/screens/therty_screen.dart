import 'package:flutter/material.dart';
import 'package:weather_example_null_safety/models/weather_forecast.dart';
import '../widgets/list_on_3_page_sort.dart';

class ThetyScreen extends StatefulWidget {
  final WeatherForecast weatherForecast;
  const ThetyScreen({super.key, required this.weatherForecast});

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
      body: WeatherListView(weatherForecast: widget.weatherForecast),
    );
  }
}
