import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({super.key, required this.updataUi});
  VoidCallback? updataUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: TextField(
              onSubmitted: (value) async {
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(CityName: value);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                hintText: 'Enter  City Name',
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                )),
                suffixIcon: Icon(Icons.search),
                label: Text('search'),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;
