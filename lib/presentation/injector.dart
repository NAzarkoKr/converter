import 'package:get_it/get_it.dart';
import 'package:weather/data/remote_data_sources/converter_remote_data.dart';
import 'package:weather/data/remote_data_sources/weather_remote_data.dart';
import 'package:weather/data/repositories/converter_repository_impl.dart';
import 'package:weather/data/repositories/weather_repository_impl.dart';
import 'package:weather/domain/repository/currency_repository.dart';
import 'package:weather/domain/repository/weather_repository.dart';
import 'package:weather/domain/usecases/get_currency_usecase.dart';
import 'package:weather/domain/usecases/get_weather_usecase.dart';
import 'package:weather/presentation/bloc/bottom_navbar_cubit/nav_bar_cubit.dart';
import 'package:weather/presentation/bloc/weather_cubit/weather_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //blocs
  sl.registerFactory(() => WeatherCubit(getWeatherUsecase: sl.call()));
  sl.registerFactory(() => NavBarCubit());

  //usecases
  sl.registerLazySingleton(
      () => GetWeatherUsecase(weatherRepository: sl.call()));
  sl.registerLazySingleton(
      () => GetCurrencyUsecase(convertRepository: sl.call()));

  //repository
  sl.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(weatherRemoteData: WeatherRemoteData()));
  sl.registerLazySingleton<ConvertRepository>(
      () => ConvertRepositoryImpl(converterRemoteData: ConverterRemoteData()));
}
