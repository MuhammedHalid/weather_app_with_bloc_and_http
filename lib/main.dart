import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc_and_http/bloc/weather_bloc.dart';
import 'package:weather_app_with_bloc_and_http/data/data_provider/weather_data_provider.dart';
import 'package:weather_app_with_bloc_and_http/data/repository/weather_repository.dart';
import 'package:weather_app_with_bloc_and_http/presentation/screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(WeatherDataProvider()),
      child: BlocProvider(
        create: (context) => WeatherBloc(
          context.read<WeatherRepository>(),
        ), // we can pass repository like this  WeatherBloc(WeatherRepository()) but use repositoryProvider
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
