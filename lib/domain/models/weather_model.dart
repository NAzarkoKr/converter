class WeatherModel {
  final double temp;
  final dynamic image;
  final String description;

  WeatherModel({
    required this.temp,
    required this.image,
    required this.description,
  });

  double get getTemp => temp - 273.15;
  String get getIcon => "https://openweathermap.org/img/wn/$image@2x.png";

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: json["main"]["temp"],
      image: json["weather"][0]["icon"],
      description: json["weather"][0]["description"],
    );
  }
}
