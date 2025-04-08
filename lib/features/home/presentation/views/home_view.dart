import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/home/presentation/manager/cubits/weather_cubit/weather_cubit.dart';
import 'package:project/features/home/presentation/manager/cubits/weather_cubit/weather_states.dart';
import 'package:project/features/home/presentation/views/search_view.dart';
import 'package:project/features/home/presentation/widgets/noweather_info_body.dart';
import 'package:project/features/home/presentation/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 32,
          ),
        ),
        // backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccessState) {
            return WeatherInfoBody(
              weatherData: BlocProvider.of<WeatherCubit>(context).weathermodel!,
            );
          } else if (state is WeatherFailureState) {
            return const Center(
              child: Text(
                'there is something wrong with the input',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20,
                ),
              ),
            );
          } else {
            return const NoWeatherInfoBody();
          }
        },
      ),
    );
  }
}
