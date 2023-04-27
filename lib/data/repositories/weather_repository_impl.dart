import 'package:weather/data/remote_data_sources/weather_remote_data.dart';
import 'package:weather/domain/models/weather_model.dart';
import 'package:weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteData weatherRemoteData;

  WeatherRepositoryImpl({required this.weatherRemoteData});
  @override
  Future<WeatherModel> getWeather(String city) async =>
      weatherRemoteData.getWeather(city);
}
