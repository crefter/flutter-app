import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weather_forecast.dart';

/*
город можно отображать а можно и без него
Но чтобы было более читабельно и понятно мы его все таки сделаем
сделаем его в колонке
тут мы создали 4 переменных которые хранят в себе информацию полученную 
из джейсона
*/

class CityView extends StatelessWidget {
  final WeatherForecast snapshot;
  const CityView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.list; //
    var city = snapshot.city.name; // название города
    var country = snapshot.city.country; // название страны 2 заглавные буквы
    var formattedDate = // отображаем текущий день беря его из джейсона под индексом 0
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt *
            1000); // умножаем на 1000 чтобы получать год наш
    return Column(
      children: <Widget>[
        Text(
          '$city, $country', //формат отображения в 1 строчке 2 переменные
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.black87,
          ),
        ),
        Text(
          // текст ниже показывающий текущую дату
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
Используем класс утил чтобы отобразить город и дату в нужном формате
можно и не использовать но лучше видеть какой город мы видим
пробовал отобразить в аппбаре но не получилось 
оставлю это на будущее - не так просто как мне кажестся
кто-то советовал использовать фризед - но с ним разбираться 
не стал к тому же говорят что от него скоро избавяться в связи
с обновлениями флатера
*/

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEEE, MMM d, y').format(dateTime);
  }
}
