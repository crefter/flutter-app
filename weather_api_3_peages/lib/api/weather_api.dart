import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/weather_forecast.dart';
import '../widgets/constants.dart';

/*
здесь сам метод который будет получать прогноз погоды по названию города
подключаем 3 пакета 
  http - чтобы работать с запросами http 
  developer - чтобы видеть логи
  convert - чтобы ковертировать json

метод асинхронный и в качестве параметра будет принимать название города  
запрашиваем парметры запроса
'appid': наш айди
'units': 'metric', - температура в цельсиях
'cnt': '3' - на 3 дня прогноз
'q': city - запрос делаем по называнию города
*/
class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast({String? city}) async {
    Map<String, String?> parameters;

    parameters = {
      'appid': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'cnt': '3',
      'q': city
    };
/*
далее создаем переменную uri с данными запроса которая хранит класс Uri
с конструктором https - передадим туда 3 параметра.
далее в логе проверяем как отправился запрос и какой ответ получен

*/
    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);
    log('request: ${uri.toString()}');

//создаем запрос в переменной response  = используя метод get
// в который передаем переменную uri и смотрим какой ответ пришел в виде json
// потом проверяем если запрос успешен == 200 - то возвращаем и декодируем json
// иначе если запрос не выполнен возвращаем ошибку - Error

    var response = await http.get(uri);
    log('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error');
    }
  }
}
