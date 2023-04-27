import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/presentation/bloc/weather_cubit/weather_cubit.dart';

class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 110)),
            _textHeader(),
            _mainWeatherContent(),
            CustomTextField(
              controller: cityController,
              hintText: 'City Name',
            ),
            CustomButton(onPressed: () {
              context
                  .read<WeatherCubit>()
                  .getWeather(city: cityController.text);
            }),
          ],
        ),
      ),
    );
  }

  Text _textHeader() {
    return const Text(
      'Check Weather\n in your city',
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    );
  }

  SizedBox _mainWeatherContent() {
    return SizedBox(
      height: 200,
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(state.weather.getIcon,
                          loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        }
                      })),
                  Text(state.weather.description),
                  Text("${state.weather.getTemp.toStringAsFixed(1)} C")
                ],
              ),
            );
          } else if (state is WeatherLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is WeatherError) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    cityController.dispose();

    super.dispose();
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "Check",
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 60,
        child: CupertinoTextField(
          placeholder: hintText,
          controller: controller,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blue,
              )),
        ),
      ),
    );
  }
}
