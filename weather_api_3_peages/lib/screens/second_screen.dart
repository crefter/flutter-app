import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_example_null_safety/bloc/weather_bloc.dart';
import 'package:weather_example_null_safety/screens/therty_screen.dart';
import '../models/weather_forecast.dart';
import '../widgets/city_view.dart';
import '../widgets/data_weather.dart';

/*
второй экран StatefulWidget имеет стейт и в нем инициализируется объект forecastObject
в котором содержатся данные о погоде

*/

class SecondScreen extends StatefulWidget {
  final String cityName;
  const SecondScreen({Key? key, required this.cityName}) : super(key: key);

  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  late Future<WeatherForecast> forecastObject;

// при инициализации состояния мы обращаемся к контексту ищем WeatherBloc
//и добавляем туда события SearchCity
//
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(SearchCity(cityQuery: widget.cityName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Погода в городе'),
        centerTitle: true,
        actions: <Widget>[
          // слушаем состояние WeatherBloc и реагируем на ошибку
          BlocConsumer<WeatherBloc, WeatherState>(listener: (context, state) {
            if (state is WeatherStateError) {
              var snackBar = SnackBar(
                //  создаем переменную в случае отсутствия интернета или города в списке
                content: Text(state //
                    .message), // будет выведено сообщение в снекбаре об ошибке
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }, builder: (context, state) {
            if (state is WeatherStateLoaded) {
              final forecastObject = state.forecastObject;
              return IconButton(
                  icon: const Icon(
                    Icons.looks_3,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ThetyScreen(weatherForecast: forecastObject);
                    }));
                  });
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ), // в BlocBuilder отрисовываем данные о погоде если данные получены
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherStateLoaded) {
            final forecastObject = state.forecastObject;
            return Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 50.0),
                  CityView(snapshot: forecastObject),
                  const SizedBox(height: 50.0),
                  DataWeather(weatherForeCast: forecastObject),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Ошибка получения данных',
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
