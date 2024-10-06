import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onSubmitted: (cityname) async {
              Navigator.of(context).pop();
              var getweathercubit = BlocProvider.of<GetWeatherCubit>(context);
              getweathercubit.getweather(city: cityname);
            },
            cursorHeight: 25,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(18),
              suffixIcon: const Icon(Icons.search),
              suffixIconColor: Colors.blue,
              label: const Text('Search'),
              // enabled: true,
              hintText: 'Enter City Name',
              // hintStyle: const TextStyle(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.orange),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
