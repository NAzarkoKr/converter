import 'package:get_it/get_it.dart';
import 'package:weather/data/remote_data_sources/weather_remote_data.dart';
import 'package:weather/data/repositories/weather_repository_impl.dart';
import 'package:weather/domain/repository/weather_repository.dart';
import 'package:weather/domain/usecases/get_weather_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //usecases
  sl.registerLazySingleton(
      () => GetWeatherUsecase(weatherRepository: sl.call()));

  //repository
  sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(weatherRemoteData: WeatherRemoteData()));
}
