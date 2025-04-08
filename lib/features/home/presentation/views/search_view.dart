import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/show_snack_bar.dart';
import 'package:project/features/home/presentation/manager/cubits/weather_cubit/weather_cubit.dart';
import 'package:project/features/home/presentation/manager/cubits/weather_cubit/weather_states.dart';
import 'package:project/features/home/presentation/views/home_view.dart';

class SearchView extends StatelessWidget {
  String? cityName;

  SearchView({Key? key}) : super(key: key);

  static String id = 'SearchView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF4A90E2), // أزرق فاتح
                Color(0xFF50C9CE), // سماوي
              ],
            ),
          ),
        ),
        title: const Text(
          'Search a City',
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 28,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black26,
                offset: Offset(2, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4A90E2), // أزرق فاتح
              Color(0xFF50C9CE), // سماوي
            ],
          ),
        ),
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state is WeatherSuccessState) {
              Navigator.pushNamed(context, HomeView.id);
            } else if (state is WeatherFailureState) {
              showSnackBar(context, state.error);
            }
          },
          builder: (context, state) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Find the Weather 🌤️',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 32,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      onChanged: (data) {
                        cityName = data;
                      },
                      onSubmitted: (data) async {
                        cityName = data;
                        BlocProvider.of<WeatherCubit>(context)
                            .getWeather(cityName: cityName!);
                        BlocProvider.of<WeatherCubit>(context).cityName =
                            cityName;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Enter a city',
                        hintStyle: const TextStyle(color: Colors.white70),
                        labelText: 'Search',
                        labelStyle: const TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: 0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white54),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 24,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (cityName != null && cityName!.isNotEmpty) {
                              BlocProvider.of<WeatherCubit>(context)
                                  .getWeather(cityName: cityName!);
                              BlocProvider.of<WeatherCubit>(context).cityName =
                                  cityName;
                            }
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
