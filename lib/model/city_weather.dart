import 'dart:convert';
/// city : "New York"
/// temperature : 20
/// condition : "Clear"
/// humidity : 60
/// windSpeed : 5.5
class CityWeather {
  CityWeather({
      this.city, 
      this.temperature, 
      this.condition, 
      this.humidity, 
      this.windSpeed,});

  CityWeather.fromJson(dynamic json) {
    city = json['city'];
    temperature = json['temperature'];
    condition = json['condition'];
    humidity = json['humidity'];
    windSpeed = json['windSpeed'];
  }
  String? city;
  num? temperature;
  String? condition;
  num? humidity;
  num? windSpeed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = city;
    map['temperature'] = temperature;
    map['condition'] = condition;
    map['humidity'] = humidity;
    map['windSpeed'] = windSpeed;
    return map;
  }
}


List<Map<String, dynamic>> weatherData = [
  {
    "city": "New York",
    "temperature": 20,
    "condition": "Clear",
    "humidity": 60,
    "windSpeed": 5.5
  },
  {
    "city": "Los Angeles",
    "temperature": 25,
    "condition": "Sunny",
    "humidity": 50,
    "windSpeed": 6.8
  },
  {
    "city": "London",
    "temperature": 15,
    "condition": "Partly Cloudy",
    "humidity": 70,
    "windSpeed": 4.2
  },
  {
    "city": "Tokyo",
    "temperature": 28,
    "condition": "Rainy",
    "humidity": 75,
    "windSpeed": 8.0
  },
  {
    "city": "Sydney",
    "temperature": 22,
    "condition": "Cloudy",
    "humidity": 55,
    "windSpeed": 7.3
  },
];