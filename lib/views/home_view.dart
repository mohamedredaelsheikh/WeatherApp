import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubits/weather_cubit/weather_cubit.dart';
import 'package:project/cubits/weather_cubit/weather_states.dart';
import 'package:project/models/weather_model.dart';
import 'package:project/views/search_view.dart';
import 'package:project/widgets/noweather_info_body.dart';
import 'package:project/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchView();
                }));
              },
              icon: const Icon(Icons.search),
            ),
          ],
          title: const Text('Weather App'),
          // backgroundColor: Colors.blue,
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccessState) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weathermodel;
            return WeatherInfoBody(weatherData: weatherData!);
          } else if (state is WeatherFailureState) {
            return const Center(
              child: Text("there is something wrong with the input"),
            );
          } else {
            return const NoWeatherInfoBody();
          }
        }));
  }
}
