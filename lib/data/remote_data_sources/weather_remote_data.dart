import 'package:dio/dio.dart';
import 'package:weather/const.dart';
import 'package:weather/domain/models/weather_model.dart';

class WeatherRemoteData {
  final client = Dio();
  Future<WeatherModel> getWeather(String city) async {
    final response = await client
        .get("${weaterUrl}data/2.5/weather?q=$city&APPID=$weatherAppId");
    return WeatherModel.fromJson(response.data);
  }
}
