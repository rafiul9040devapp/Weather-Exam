import 'package:weather_exam/model/city_weather.dart';

Future<List<CityWeather>> getCityWeather() async {
  List<CityWeather> cityWeatherList =
      weatherData.map((data) => CityWeather.fromJson(data)).toList();
  return cityWeatherList;
}
