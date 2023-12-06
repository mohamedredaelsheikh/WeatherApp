import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubits/weather_cubit/weather_states.dart';
import 'package:project/models/weather_model.dart';
import 'package:project/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.weatherservice}) : super(WeatherInitialState());
  WeatherModel? weathermodel;
  WeatherService weatherservice;
  String? cityname;
  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weathermodel = await weatherservice.getWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }
}
