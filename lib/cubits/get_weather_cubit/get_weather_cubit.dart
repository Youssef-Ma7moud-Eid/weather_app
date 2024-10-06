import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_status.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<Allstatus> {
  GetWeatherCubit() : super(NoWeatherstate());
  WeatherModel? model;
  Future<void> getweather({required String city}) async {
    try {
      model = await WeatherServices().getcurweather(catagory: city);
      emit(WeatherstateSucsses());
    } on Exception catch (e) {
      emit(NoWeatherstate());
    }
  }
}
