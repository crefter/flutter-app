import 'dart:developer';
import 'dart:ffi';
import 'package:flutter/material.dart';
import '../models/weather_forecast.dart';
import 'forecast_card.dart';

/*
здесь мы отображаем данные о погоде за 3 дня используя ListView.separated
чтобы отобразить в колонку данные и разделить их

В getSortedList при помощи цикла выбираем из 3х дней температуру самую низкую
и ставим этот день первым


*/

class WeatherListView extends StatelessWidget {
  final WeatherForecast weatherForecast;
  const WeatherListView({Key? key, required this.weatherForecast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortedList = getSortedList(weatherForecast.list!);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 540,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.blue,
              height: 3.0,
              thickness: 3.0,
            ),
            itemCount: sortedList.length,
            itemBuilder: (context, index) => Container(
              color: Colors.green,
              child: forecastCard(sortedList, index),
            ),
          ),
        ),
      ],
    );
  }
}

List<WeatherList> getSortedList(List<WeatherList> list) {
  double min = list.first.temp.day;
  List<WeatherList> newList = [];
  int minIndex = 0;
  // List<Double> newList2 = [];

  for (int i = 0; i < list.length; i++) {
    if (list[i].temp.day < min) {
      min = list[i].temp.day;
      minIndex = i;
      // newList2.add(min as Double);
    }
  }

  newList = List<WeatherList>.from(list);
  newList.removeAt(minIndex);
  newList.insert(0, list[minIndex]);

  // log(minIndex as );
  return newList;
}
