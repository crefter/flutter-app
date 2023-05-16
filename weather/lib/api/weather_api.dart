import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/weather_forecast_daily.dart';
import '../utilities/constants.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast({String? city}) async {
    Map<String, String?> parameters;

    parameters = {
      'appid': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'cnt': '3',
      'q': city
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);
    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    log('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
