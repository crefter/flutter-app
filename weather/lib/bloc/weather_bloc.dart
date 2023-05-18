import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_example_null_safety/api/weather_api.dart';
import 'package:weather_example_null_safety/models/weather_forecast.dart';

/*
тут мы используем Bloc чтобы получить данные из API
*/

class WeatherBloc extends Bloc<WeatherFetchEvent, WeatherState> {
  WeatherBloc() : super(WeatherStateEmpty()) {
//на событие SearchCity вызывается метод _onSearchCity
    on<SearchCity>(_onSearchCity);
  }

  void _onSearchCity(
      WeatherFetchEvent event, Emitter<WeatherState> emitter) async {
    WeatherForecast forecastObject;

//если какие-то события пришли
    if (event is SearchCity) {
      // в классе апи вызываем метод
      forecastObject = await WeatherApi()
          .fetchWeatherForecast(
              city: event.cityQuery) // который принимает название города
          .then((forecastObject) {
        // и тут происходит возвращение данных о погоде и выпускаем состояние WeatherStateLoaded
        emit(WeatherStateLoaded(forecastObject: forecastObject));
        return forecastObject;
      }).catchError((err) {
        // если ошибка выпускаем состояние WeatherStateError
        emit(WeatherStateError(message: err));
      });
    }
  }
}
// события WeatherBloc

abstract class WeatherFetchEvent extends Equatable {
  const WeatherFetchEvent();

  @override
  List<Object> get props => [];
}

class SearchCity extends WeatherFetchEvent {
  final String cityQuery;

  const SearchCity({required this.cityQuery});
}

// состояния WeatherBloc
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

class WeatherStateError extends WeatherState {
  final String message;

  const WeatherStateError({required this.message});

  @override
  List<Object> get props => [message];
}
