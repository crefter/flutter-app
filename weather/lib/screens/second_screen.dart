import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_example_null_safety/bloc/weather_bloc.dart';
import 'package:weather_example_null_safety/screens/therty_screen.dart';

import '../models/weather_forecast_daily.dart';
import '../widgets/city_view.dart';
import '../widgets/data_weather.dart';

class SecondScreen extends StatefulWidget {
  final String cityName;
  const SecondScreen({Key? key, required this.cityName}) : super(key: key);

  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  late Future<WeatherForecast> forecastObject;

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
          BlocConsumer<WeatherBloc, WeatherState>(listener: (context, state) {
            if (state is WeatherStateError) {
              var snackBar = SnackBar(
                content: Text(state.message),
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
                      return ThetyScreen(forecastObject: forecastObject);
                    }));
                  });
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ),
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
                  DataWeather(snapshot: forecastObject),
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
