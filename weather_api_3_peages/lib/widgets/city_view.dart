import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weather_forecast.dart';

/*
отображаем город температуру влажность скорость ветра
*/

class CityView extends StatelessWidget {
  final WeatherForecast snapshot;
  const CityView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.list;
    var city = snapshot.city.name;
    var country = snapshot.city.country;
    var formattedDate = // отображаем текущий день беря его из джейсона под индексом 0
        DateTime.fromMillisecondsSinceEpoch(
            forecastList![0].dt * 1000); // умножаем на 1000 чтобы получить год
    return Column(
      children: <Widget>[
        Text(
          '$city, $country',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.black87,
          ),
        ),
        Text(
          Util.getFormattedDate(formattedDate),
          style: const TextStyle(
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }
}

/*
Используем класс Util чтобы отобразить город и дату в нужном формате
мы используем DateFormat из пакета Intl
*/

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEEE, MMM d, y').format(dateTime);
  }
}
