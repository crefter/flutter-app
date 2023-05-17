import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_example_null_safety/api/weather_api.dart';
import 'package:weather_example_null_safety/models/weather_forecast.dart';

/*


*/

class WeatherBloc extends Bloc<WeatherFetchEvent, WeatherState> {
  WeatherBloc() : super(WeatherStateEmpty()) {
    on<SearchCity>(_onSearchCity);
  }

  void _onSearchCity(
      WeatherFetchEvent event, Emitter<WeatherState> emitter) async {
    WeatherForecast forecastObject;

    if (event is SearchCity) {
      emit(WeatherStateLoading());

      forecastObject = await WeatherApi()
          .fetchWeatherForecast(city: event.cityQuery)
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

class WeatherStateError extends WeatherState {
  final String message;

  const WeatherStateError({required this.message});

  @override
  List<Object> get props => [message];
}
