import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_status.dart';
import 'package:weather_app/views/login.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widget/noweather_widget.dart';
import 'package:weather_app/widget/weather_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const Login();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.playlist_add_check_rounded,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GetWeatherCubit, Allstatus>(
        builder: (context, state) {
          if (state is NoWeatherstate) {
            return NoweatherWidget();
          } else if (state is WeatherstateSucsses) {
            return WeatherPage();
          } else {
            return NoweatherWidget();
          }
        },
      ),
    );
  }
}
