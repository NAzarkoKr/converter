import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/domain/models/weather_model.dart';
import 'package:weather/domain/usecases/get_weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUsecase getWeatherUsecase;
  WeatherCubit({required this.getWeatherUsecase}) : super(WeatherInitial());

  getWeather({required String city}) async {
    emit(WeatherLoading());
    try {
      final weather = await getWeatherUsecase.call(city: city);
      emit(WeatherLoaded(weather: weather));
    } on DioError catch (e) {
      final result = e.response!.data as Map<String, dynamic>;
      emit(WeatherError(message: result['message']));
    }
  }
}
