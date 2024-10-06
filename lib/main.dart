import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_status.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/views/cardview.dart';
import 'package:weather_app/views/home_page.dart';
import 'package:weather_app/views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, Allstatus>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                          .model
                          ?.weatherstate ??
                      '',
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const Login(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? state) {
  switch (state) {
    case " ":
      return Colors.amber;
    case null:
      return Colors.amber;
    case "Sunny":
      return Colors.amber;
    case "Partly cloudy":
      return Colors.lightBlue;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
      return Colors.blueGrey;
    case "Mist":
    case "Patchy rain possible":
      return Colors.lightGreen;
    case "Patchy snow possible":
    case "Patchy sleet possible":
      return Colors.teal;
    case "Patchy freezing drizzle possible":
      return Colors.cyan;
    case "Thundery outbreaks possible":
      return Colors.deepPurple;
    case "Blowing snow":
    case "Blizzard":
      return Colors.blue;
    case "Fog":
    case "Freezing fog":
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Patchy light rain":
    case "Light rain":
      return Colors.green;
    case "Moderate rain at times":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Patchy light snow":
    case "Light snow":
    case "Moderate snow":
    case "Heavy snow":
    case "Ice pellets":
      return Colors.brown;
    case "Light rain shower":
      return Colors.lightGreen;
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Patchy light rain with thunder":
      return Colors.deepOrange;
    case "Moderate or heavy rain with thunder":
      return Colors.red;
    case "Patchy light snow with thunder":
      return Colors.indigo;
    case "Moderate or heavy snow with thunder":
      return Colors.purple;
    default:
      return Colors.grey;
  }
}
