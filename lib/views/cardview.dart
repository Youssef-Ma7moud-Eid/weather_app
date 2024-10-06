import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/getshape.dart';

class CardView extends StatelessWidget {
  const CardView({super.key, required this.model, required this.index});
  final WeatherModel model;
  final int index;
  @override
  Widget build(BuildContext context) {
    String s = model.list[index]["time"];
    double s2 = model.list[index]["temp_c"];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        color: const Color(0XFF6B9DFC),
      ),
      width: 78,
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            '${s[11] + s[12]}:${s[14] + s[15]}',
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 252, 254, 255),
            ),
          ),
          Container(
            height: 55,
            width: 50,
            child: model.list[index]["condition"]["icon"] != null
                ? CachedNetworkImage(
                    imageUrl: model.list[index]["condition"]["icon"],
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      getshape(model.list[index]["condition"]["text"]),
                    ),
                  )
                : Image.asset('assets/images/rainy.png'),
          ),
          Text(
            '${s2.toInt()}°c',
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 252, 254, 255),
            ),
          ),
        ],
      ),
    );
  }
}

DateTime gettime(String time) {
  return DateTime.parse(time);
}
