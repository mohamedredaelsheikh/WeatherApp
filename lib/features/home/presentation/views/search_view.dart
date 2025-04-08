import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/home/presentation/manager/cubits/weather_cubit/weather_cubit.dart';
import 'package:project/features/home/presentation/views/home_view.dart';

class SearchView extends StatelessWidget {
  String? cityName;
  SearchView({
    Key? key,
  }) : super(key: key);
  static String id = 'SearchView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;

              // Navigator.pushReplacementNamed(context, HomeView.id);
              Navigator.pushNamed(context, HomeView.id);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: const Text('search'),
              suffixIcon: GestureDetector(
                  onTap: () async {}, child: const Icon(Icons.search)),
              border: const OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
