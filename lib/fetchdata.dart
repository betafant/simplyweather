import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

List<Weather> parseWeather(String responseBody) {
  final hourly = jsonDecode(responseBody)['hourly'];
  final parsed = hourly.cast<Map<String, dynamic>>();
  return parsed.map<Weather>((json) => Weather.fromJson(json)).toList();
}

Future<List<Weather>> fetchWeather() async {
  final queryParameters = {
    'lat': 'your latitude',
    'lon': 'your longitude',
    'exclude': 'current,minutely,daily,alerts',
    'units': 'metric',
    'appid': 'your apikey',
  };

  final uri =
      Uri.https('api.openweathermap.org', '/data/2.5/onecall', queryParameters);
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    return compute(parseWeather, response.body);
  } else {
    throw Exception('Failed to load weather');
  }
}

class Weather {
  final String dt;
  final String real;
  final String feel;
  final String wind;
  final String desc;
  final String icon;

  const Weather({
    required this.dt,
    required this.real,
    required this.feel,
    required this.wind,
    required this.desc,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      dt: json['dt'].toString(),
      real: json['temp'].toString(),
      feel: json['feels_like'].toString(),
      wind: json['wind_speed'].toString(),
      desc: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}
