import 'package:weather/domain/models/weather_model.dart';
import 'package:weather/domain/repository/weather_repository.dart';

class GetWeatherUsecase {
  final WeatherRepository weatherRepository;

  GetWeatherUsecase({required this.weatherRepository});

  Future<WeatherModel> call({required String city}) =>
      weatherRepository.getWeather(city);
}
