import 'package:flutter/material.dart';

import '../models/weather_forecast_daily.dart';

class DataWeather extends StatelessWidget {
  final WeatherForecast snapshot;
  const DataWeather({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.list;
    var temp = forecastList?[0].temp.day.toStringAsFixed(0);
    var humidity = forecastList?[0].humidity.toStringAsFixed(0);
    var wind = forecastList?[0].speed.toStringAsFixed(0);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Температура $temp °C',
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 50.0),
        Text(
          'Влажность $humidity %',
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 50.0),
        Text(
          'Скорость ветра $wind m/s',
          style: const TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
