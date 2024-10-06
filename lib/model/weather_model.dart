class WeatherModel {
  final String city;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weatherstate;
  final String? image;
  final DateTime date;
  final List<dynamic> list;
  final int cloud;
  final num? air;
  final num? rain;

  const WeatherModel(
      {required this.rain,
      required this.list,
      required this.air,
      required this.cloud,
      required this.image,
      required this.date,
      required this.temp,
      required this.city,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherstate});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      rain: json["forecast"]["forecastday"][0]["day"]["daily_chance_of_rain"],
      air: json["forecast"]["forecastday"][0]["day"]["avgvis_km"],
      cloud: json["forecast"]["forecastday"][0]["hour"][0]["cloud"],
      list: json["forecast"]["forecastday"][0]["hour"],
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      date: DateTime.parse(json["current"]["last_updated"]),
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      city: json["location"]["name"],
      maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weatherstate: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
    );
  }
}
