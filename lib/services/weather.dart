import 'dart:convert';
import 'package:http/http.dart' as http;

class weatherService {
  void getmethod() {}
}

class Weather {
  final String city;
  final double temperature;
  final String condition;

  Weather(
      {required this.city, required this.temperature, required this.condition});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['location']['name'],
      temperature: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
    );
  }
}

class WeatherService {
  final String apiKey =
      '9d6595f796aa46e7874141631241103'; // Replace with your API key

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(
      Uri.parse(
          'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
