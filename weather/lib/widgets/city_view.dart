import 'package:flutter/material.dart';
import '../models/weather_forecast.dart';
import '../utilities/forecast_util.dart';

/*

*/

class CityView extends StatelessWidget {
  final WeatherForecast snapshot;
  const CityView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.list;
    var city = snapshot.city.name;
    var country = snapshot.city.country;
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt * 1000);
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
