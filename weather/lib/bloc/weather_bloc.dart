import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_example_null_safety/api/weather_api.dart';
import 'package:weather_example_null_safety/models/weather_forecast.dart';

/*
тут мы используем блок принимая событие и выдавая состояние
используем функцию on которая реагирует на Event,ы которые мы передаем
в дженерик и принимает в себя функцию колбеком _onSearchCity
*/

class WeatherBloc extends Bloc<WeatherFetchEvent, WeatherState> {
  WeatherBloc() : super(WeatherStateEmpty()) {
    on<SearchCity>(_onSearchCity);
  }

  void _onSearchCity(
// эта функция имеет доступ к SearchCity, к событию и к эмиту который позволит нам менять состояние
      WeatherFetchEvent event,
      Emitter<WeatherState> emitter) async {
    WeatherForecast forecastObject;

    if (event is SearchCity) {
      //если какие-то события пришли
      forecastObject = await WeatherApi() // в классе апи вызываем метод
          .fetchWeatherForecast(
              city: event.cityQuery) // который принимает название города
          .then((forecastObject) {
        emit(WeatherStateLoaded(forecastObject: forecastObject));
        return forecastObject;
      }).catchError((err) {
        emit(WeatherStateError(message: err));
      });
    }
  }
}

abstract class WeatherFetchEvent extends Equatable {
  const WeatherFetchEvent();

  @override
  List<Object> get props => [];
}

class SearchCity extends WeatherFetchEvent {
  final String cityQuery;

  const SearchCity({required this.cityQuery});
}

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherStateEmpty extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherStateLoaded extends WeatherState {
  final WeatherForecast forecastObject;

  const WeatherStateLoaded({required this.forecastObject});

  @override
  List<Object> get props => [forecastObject];
}

// класс который выводит сообщение об ошибке с переменной месседж и конструктором
//
class WeatherStateError extends WeatherState {
  final String message;

  const WeatherStateError({required this.message});

  @override
  List<Object> get props => [message];
}
