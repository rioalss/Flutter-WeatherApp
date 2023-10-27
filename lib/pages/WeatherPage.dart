import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:weather_app/bloc/forecast_bloc.dart';
import 'package:weather_app/services/service.dart';
import '../models/WeatherModel.dart';
import '../services/func.dart';


//!
//! Created by  
//! Rio Alss

//? Github 
//? rioalss

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForecastBloc(service: Service())..add(LoadData()),
      child: Scaffold(
        body:
            BlocBuilder<ForecastBloc, ForecastState>(builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Loaded) {
            return carouselWidget(
              context,
              state.data,
            );
          } else if (state is Error) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const Center(
              child: Text('No State'),
            );
          }
        }),
      ),
    );
  }
}

CarouselSlider carouselWidget(BuildContext context, List<WeatherModel> model) {
  final List ic = [
    "assets/icons/Sky.png",
    "assets/icons/Sun.png",
    "assets/icons/Partly.png",
    "assets/icons/Overcast.png",
    "assets/icons/Rain.png",
  ];
  final List fc = [
    "Clear Sky",
    "Mainly Clear",
    "Partly Clear",
    "Overcast",
    "Rain",
  ];
  final List riv = [
    "assets/Rive/clear_sky.riv",
    "assets/Rive/main.riv",
    "assets/Rive/partly.riv",
    "assets/Rive/overcast.riv",
    "assets/Rive/rain.riv",
  ];
  return CarouselSlider.builder(
    itemCount: model.length,
    itemBuilder: (context, index, realIndex) => Column(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              child: RiveAnimation.asset(
                riv[index],
                  // getRive(int.parse(model[index].daily!.weathercode!.join(''))),
                  fit: BoxFit.fill),
            )),
        Expanded(
          flex: 1,
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF080808),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(
                          getCountry(model[index].timezone!),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          fc[index]
                          // getForecast(int.parse(
                          //     model[index].daily!.weathercode!.join('')))
                              ,
                          style: const TextStyle(
                            fontSize: 15,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(ic[index]
                          // getIcon(int.parse(
                          //   model[index].daily!.weathercode!.join('')))
                            ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${model[index].daily!.apparentTemperatureMax!.join('')} \u2103',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
    options: CarouselOptions(
        autoPlay: false,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1,
        height: MediaQuery.of(context).size.height),
  );
}
