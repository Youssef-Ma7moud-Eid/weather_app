import 'package:dio/dio.dart';
import 'package:weather_app/die_faliure%20(2).dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherServices {
  final Dio dio = Dio();

  final String baseurl = "http://api.weatherapi.com/v1";
  final String apikey = "bec2b39bd3564efc9eb211434240109";

  Future<WeatherModel> getcurweather({required String catagory}) async {
    try {
      final Response response = await dio.get(
          '$baseurl/forecast.json?key=$apikey&q=$catagory&days=1&aqi=no&alerts=no');
      Map<String, dynamic> json = response.data;
      // Map<String, dynamic> articles = json["forecast"];

      // List<Map<String, dynamic>> data = articles["forecastday"];

      return WeatherModel.fromJson(json);
    } on DioException catch (e) {
      var errormessage = ServerFailure.fromDioError(e);
      throw Exception(errormessage);
    } catch (e) {
      throw Exception('OOps error');
    }
  }
}
