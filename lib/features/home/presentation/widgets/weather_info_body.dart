import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart'; // استيراد مكتبة flutter_animate
import 'package:project/features/home/presentation/manager/cubits/weather_cubit/weather_cubit.dart';
import 'package:project/features/home/data/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            BlocProvider.of<WeatherCubit>(context).getThemeColor(),
            BlocProvider.of<WeatherCubit>(context).getThemeColor()[300]!,
            BlocProvider.of<WeatherCubit>(context).getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          // اسم المدينة
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: const TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 36,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black26,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ).animate().fadeIn(
                duration: 800.ms,
                curve: Curves.easeIn,
              ),

          const SizedBox(height: 10),

          // وقت التحديث
          Text(
            'Updated at: ${weatherData!.date.hour.toString().padLeft(2, '0')}:${weatherData!.date.minute.toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Pacifico',
              color: Colors.white70,
            ),
          ).animate().fadeIn(
                duration: 800.ms,
                delay: 200.ms,
                curve: Curves.easeIn,
              ),

          const SizedBox(height: 40),

          // Card لعرض بيانات الطقس
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // صورة حالة الطقس
                Image.asset(
                  weatherData!.getImage(),
                  height: 80,
                  width: 80,
                )
                    .animate()
                    .fadeIn(
                      duration: 800.ms,
                      delay: 400.ms,
                    )
                    .scaleXY(
                      begin: 0.5,
                      end: 1.0,
                      duration: 800.ms,
                      delay: 400.ms,
                      curve: Curves.easeInOut,
                    ),

                // درجة الحرارة
                Text(
                  '${weatherData!.temp.toInt()}°',
                  style: const TextStyle(
                    fontSize: 40,
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ).animate().slideX(
                      begin: 0.5,
                      end: 0.0,
                      duration: 800.ms,
                      delay: 600.ms,
                      curve: Curves.easeInOut,
                    ),

                // الحد الأقصى والأدنى للحرارة
                Column(
                  children: [
                    Text(
                      'Max: ${weatherData!.maxTemp.toInt()}°',
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Pacifico',
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Min: ${weatherData!.minTemp.toInt()}°',
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Pacifico',
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ).animate().slideX(
                      begin: -0.5,
                      end: 0.0,
                      duration: 800.ms,
                      delay: 600.ms,
                      curve: Curves.easeInOut,
                    ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // حالة الطقس
          Text(
            weatherData!.weatherStateName,
            style: const TextStyle(
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
          ).animate().fadeIn(
                duration: 800.ms,
                delay: 800.ms,
                curve: Curves.easeIn,
              ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
