import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/service.dart';

import '../models/WeatherModel.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final Service service;
  ForecastBloc({required this.service}) : super(Initial()) {
    on<LoadData>((event, emit) async {
      emit(Loading());
      try {
        List<WeatherModel> result = await service.getData();
        emit(Loaded(result));
      } catch (error) {
        emit(Error(error.toString()));
      }
    });
  }
}
