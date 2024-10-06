import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/getshape.dart';
import 'package:weather_app/views/cardview.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel model = BlocProvider.of<GetWeatherCubit>(context).model!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0XFF2B65F4),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Row(
                          children: [
                            const Icon(Icons.nightlight_round),
                            const Spacer(
                              flex: 1,
                            ),
                            Container(
                              width: 22,
                              height: 30,
                              child:
                                  Image.asset('assets/images/placeholder.png'),
                            ),
                            Text(
                              model.city,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 170,
                        width: 185,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: "https:${model.image}" != null
                                ? AssetImage(
                                    getshape(model.weatherstate),
                                  )
                                : const AssetImage('assets/images/rainy.png'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        '${model.temp.round()}°',
                        style: const TextStyle(
                          color: Color(0XFF9BCAF2),
                          fontWeight: FontWeight.w800,
                          fontSize: 60,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        model.weatherstate,
                        style: const TextStyle(
                          color: Color(0XFF9BCAF2),
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Updated at ${model.date.hour}:${model.date.minute}',
                        style: const TextStyle(
                          color: Color(0XFF9BCAF2),
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        height: 5,
                        child: const Divider(
                          thickness: 1.8,
                          color: Color(0XFF9BCAF2),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset('assets/images/wind.png'),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  model.air != null ? '${model.air}Km' : '0',
                                  // '${model.cloud}%',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 252, 254, 255),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset('assets/images/water.png'),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  model.air != null ? '${model.rain}%' : '0% ',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 252, 254, 255),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                      'assets/images/internet_15114062.png'),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '${model.cloud}%',
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 252, 254, 255),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Text(
                      //   'Max: ${model.maxtemp.round()}°c',
                      //   style: const TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.w500,
                      //     fontSize: 16,
                      //   ),
                      // ),
                      // Text(
                      //   'Min: ${model.mintemp.round()}°c',
                      //   style: const TextStyle(
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.w500,
                      //     fontSize: 16,
                      //   ),
                      // ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '     Today',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      'Forcasts',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 135,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: model.list.length,
                    itemBuilder: (context, index) {
                      return CardView(
                        model: model,
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
