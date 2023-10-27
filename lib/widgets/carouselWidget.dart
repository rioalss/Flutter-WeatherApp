import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../models/weatherModel.dart';

CarouselSlider carousel2Widget(BuildContext context, String nameBg, String city,
    String weather, String nameIcon, String celcius, List<WeatherModel> model) {
  return CarouselSlider.builder(
    itemCount: model.length,
    itemBuilder: (context, index, realIndex) => Column(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              child: RiveAnimation.asset(nameBg, fit: BoxFit.fill),
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
                          city,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          weather,
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
                        Image.asset(nameIcon),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '$celcius \u2103',
                      style: const TextStyle(
                        fontSize: 40,
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
    options: CarouselOptions(autoPlay: false, scrollDirection: Axis.horizontal),
  );
}

