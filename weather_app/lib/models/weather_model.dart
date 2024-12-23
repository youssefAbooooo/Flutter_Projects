class WeatherModel {
  final String cityName;
  final DateTime lastUpdatedDate;
  final String date;
  final num avrTemp;
  final num maxTemp;
  final num minTemp;
  final String image;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.lastUpdatedDate,
      required this.date,
      required this.avrTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.image,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      lastUpdatedDate: DateTime.parse(json["current"]["last_updated"]),
      date: json["forecast"]["forecastday"][0]["date"],
      avrTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
    );
  }
}
