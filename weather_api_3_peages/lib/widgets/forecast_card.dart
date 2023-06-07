import 'package:flutter/material.dart';
import '../models/weather_forecast.dart';
import 'city_view.dart';

/*
виджет-карточки на 3 странице в которых отображаются данные прогноза погоды на 3 дня
*/

Widget forecastCard(List<WeatherList> list, int index) {
  var dayOfWeek = ''; // переменаая хранящая название дня недели
  DateTime date = DateTime.fromMillisecondsSinceEpoch(
      list[index].dt * 1000); // выводим сегодняшние данные места и времени
  var fullDate = Util.getFormattedDate(
      date); // переменаая хранящая данные сегодняшнего дня
  dayOfWeek = fullDate;
  var tempMin = list[index].temp.min.toStringAsFixed(0);
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: const TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$tempMin °C',
                      style: const TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
