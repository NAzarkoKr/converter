import 'package:weather/domain/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeather(String city);
}
