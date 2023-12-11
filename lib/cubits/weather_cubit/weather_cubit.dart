import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubits/weather_cubit/weather_states.dart';
import 'package:project/models/weather_model.dart';
import 'package:project/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.weatherservice}) : super(WeatherInitialState());
  WeatherModel? weathermodel;
  WeatherService weatherservice;
  String? cityName;
  MaterialColor? appBarColor;
  Future<void> getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weathermodel = await weatherservice.getWeather(cityName: cityName);
      appBarColor = getThemeColor();
      emit(WeatherSuccessState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }

  MaterialColor getThemeColor() {
    if (weathermodel!.weatherStateName == 'Sunny' ||
        weathermodel!.weatherStateName == 'Clear' ||
        weathermodel!.weatherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if (weathermodel!.weatherStateName == 'Blizzard' ||
        weathermodel!.weatherStateName == 'Patchy snow possible' ||
        weathermodel!.weatherStateName == 'Patchy sleet possible' ||
        weathermodel!.weatherStateName == 'Patchy freezing drizzle possible' ||
        weathermodel!.weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weathermodel!.weatherStateName == 'Freezing fog' ||
        weathermodel!.weatherStateName == 'Fog' ||
        weathermodel!.weatherStateName == 'Heavy Cloud' ||
        weathermodel!.weatherStateName == 'Mist' ||
        weathermodel!.weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weathermodel!.weatherStateName == 'Patchy rain possible' ||
        weathermodel!.weatherStateName == 'Heavy Rain' ||
        weathermodel!.weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weathermodel!.weatherStateName ==
            'Thundery outbreaks possible' ||
        weathermodel!.weatherStateName ==
            'Moderate or heavy snow with thunder' ||
        weathermodel!.weatherStateName == 'Patchy light snow with thunder' ||
        weathermodel!.weatherStateName == 'Moderate rain' ||
        weathermodel!.weatherStateName ==
            'Moderate or heavy rain with thunder' ||
        weathermodel!.weatherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.blue;
    }
  }
}
