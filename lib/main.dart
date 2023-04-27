import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/presentation/bloc/weather_cubit/weather_cubit.dart';
import 'package:weather/presentation/injector.dart' as di;
import 'package:weather/presentation/weather.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
        create: (context) => di.sl<WeatherCubit>(),
        child: const CupertinoApp(
          title: 'Flutter Demo',
          home: WeatherHome(),
        ));
  }
}
