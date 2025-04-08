import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubits/weather_cubit/weather_cubit.dart';
import 'package:project/features/Auth/presentation/manager/AuthBloc/auth_bloc.dart';
import 'package:project/features/Auth/presentation/views/login_view.dart';
import 'package:project/features/Auth/presentation/views/register_view.dart';
import 'package:project/firebase_options.dart';
import 'package:project/services/weather_service.dart';
import 'package:project/views/home_view.dart';
import 'package:project/views/search_view.dart';

import 'cubits/weather_cubit/weather_states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return MultiBlocProvider(
        providers: [
          BlocProvider<WeatherCubit>(
            create: (context) => WeatherCubit(weatherservice: WeatherService()),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(), // هنا بنوفر الـ AuthBloc
          ),
        ],
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  color: BlocProvider.of<WeatherCubit>(context).weathermodel ==
                          null
                      ? Colors.blue
                      : BlocProvider.of<WeatherCubit>(context).appBarColor,
                ),
              ),
              routes: {
                LoginView.id: (context) => const LoginView(),
                RegisterView.id: (context) => const RegisterView(),
                SearchView.id: (context) => SearchView(),
                HomeView.id: (context) => HomeView(state: state),
              },
              initialRoute: LoginView.id,
            );
          },
        ));
  }
}
