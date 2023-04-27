import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/presentation/bloc/bottom_navbar_cubit/nav_bar_cubit.dart';
import 'package:weather/presentation/bloc/currency_converter_bloc/currency_converter_bloc.dart';
import 'package:weather/presentation/bloc/weather_cubit/weather_cubit.dart';
import 'package:weather/presentation/converter.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider<NavBarCubit>(create: (context) => di.sl<NavBarCubit>()),
          BlocProvider<WeatherCubit>(
              create: (context) => di.sl<WeatherCubit>()),
          BlocProvider<CurrencyConverterBloc>(
              create: (context) => di.sl<CurrencyConverterBloc>())
        ],
        child: CupertinoApp(
          localizationsDelegates: const [
            DefaultMaterialLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          title: 'Flutter Demo',
          home: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cloud_fill),
                  label: 'Weather',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.arrow_2_circlepath_circle),
                  label: 'Converter',
                ),
              ],
            ),
            tabBuilder: (BuildContext context, int index) {
              return BlocBuilder<NavBarCubit, NavBarState>(
                  builder: (context, state) {
                if (index == 0) {
                  return const WeatherHome();
                } else if (index == 1) {
                  return const ConvertHome();
                }
                return Container();
              });
            },
          ),
        ));
  }
}
