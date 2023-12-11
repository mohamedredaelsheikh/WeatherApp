import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubits/weather_cubit/weather_cubit.dart';
import 'package:project/services/weather_service.dart';
import 'package:project/views/home_view.dart';

import 'cubits/weather_cubit/weather_states.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(weatherservice: WeatherService());
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: AppBarTheme(
            color: BlocProvider.of<WeatherCubit>(context).weathermodel == null
                ? Colors.blue
                : BlocProvider.of<WeatherCubit>(context).appBarColor,
          )),
          home: HomeView(state: state),
        );
      },
    );
  }
}
