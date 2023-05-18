import 'package:flutter/material.dart';
import '../models/weather_forecast.dart';

/*
2 экран с виджитами и переменными хранящие данные о погоде на текущий день
*/

class DataWeather extends StatelessWidget {
  final WeatherForecast weatherForeCast;
  const DataWeather({Key? key, required this.weatherForeCast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = weatherForeCast.list;
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
