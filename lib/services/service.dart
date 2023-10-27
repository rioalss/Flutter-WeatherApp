import 'dart:async';
import 'package:dio/dio.dart';
import 'package:weather_app/models/WeatherModel.dart';

class Service {
  final _dio = Dio();
  Future<List<WeatherModel>> getData() async {
    Response response = await _dio.get(
        'https://api.open-meteo.com/v1/forecast?latitude=19.375,35,51.5,36.5,-42.125&longitude=-97.25,105,-0.120000124,127.75,173.875&daily=weathercode,apparent_temperature_max&timezone=auto,auto,auto,auto,auto&forecast_days=1&models=gem_global');
    List<dynamic> list = response.data;
    return list.map((list) => WeatherModel.fromJson(list)).toList();
  }
}
