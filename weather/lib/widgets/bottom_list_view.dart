import 'dart:developer';

import 'package:flutter/material.dart';
import '../models/weather_forecast_daily.dart';
import 'forecast_card.dart';

class BottomListView extends StatelessWidget {
  final WeatherForecast snapshot;
  const BottomListView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortedList = getSortedList(snapshot.list!);
    log(sortedList.length.toString());
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

  for (int i = 0; i < list.length; i++) {
    if (list[i].temp.day < min) {
      min = list[i].temp.day;
      minIndex = i;
    }
  }

  newList = List<WeatherList>.from(list);
  newList.removeAt(minIndex);
  newList.insert(0, list[minIndex]);

  print(list);
  print(newList);
  return newList;
}
