import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

// ignore: non_constant_identifier_names
class _HomePageState extends State<HomePage> {
  get weatherData => null;

  void updataUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFEF6DB),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(
                    updataUi: updataUi,
                  );
                }));
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
       body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return  WeatherInfoBody(
                weather: state.weatherModel ,
              );
            } else {
              return const Text('opps there was an error ');
            }
          },
        ));
        
  }
}
       
