part of 'forecast_bloc.dart';

@immutable
sealed class ForecastState {}

final class Initial extends ForecastState {}

final class Loading extends ForecastState {}

final class Loaded extends ForecastState {
  final List<WeatherModel> data;

  Loaded(this.data);
}

final class Error extends ForecastState {
  final String error;
  Error(this.error);
}
