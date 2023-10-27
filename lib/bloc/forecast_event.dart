part of 'forecast_bloc.dart';

@immutable
sealed class ForecastEvent {}

final class LoadData extends ForecastEvent{}