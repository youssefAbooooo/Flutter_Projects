class WeatherModel {
  final String cityName;
  final String countryName;
  final DateTime lastUpdated;
  final num avrTemp;
  final num minTemp;
  final num maxTemp;
  final String weatherCondition;
  final String image;

  WeatherModel(
      {required this.cityName,
      required this.countryName,
      required this.lastUpdated,
      required this.avrTemp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherCondition,
      required this.image});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      countryName: json["location"]["country"],
      lastUpdated: DateTime.parse(json["current"]["last_updated"]),
      avrTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
    );
  }
}
