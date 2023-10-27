import 'package:timezone_to_country/timezone_to_country.dart';

String getCountry(String timezone) {
  String code = TimeZoneToCountry.getCountryCode(timezone);
  switch (code) {
    case 'MX':
      return 'Mexico';
    case 'KR':
      return 'South Korea';
    case 'CN':
      return 'China';
    case 'NZ':
      return 'New Zealand';
    case 'GB':
      return 'London';
    default:
      return 'Nothing';
  }
}

String getForecast(int code) {
  if (code == 0) {
    return 'Clear Sky';
  } else if (code == 1) {
    return 'Mainly Clear';
  } else if (code == 2) {
    return 'Partly Cloud';
  } else if (code == 3 || code >= 45 && code <= 48) {
    return 'Overcast';
  } else if (code >= 51 && code <= 67) {
    return 'Rain';
  } else {
    return 'No Forecast';
  }
}

String getIcon(int code) {
  if (code == 0) {
    return "assets/icons/Sky.png";
  } else if (code == 1) {
    return "assets/icons/Sun.png";
  } else if (code == 2) {
    return "assets/icons/Partly.png";
  } else if (code == 3 || code >= 45 && code <= 48) {
    return "assets/icons/Overcast.png";
  } else if (code >= 51 && code <= 67) {
    return "assets/icons/Rain.png";
  } else {
    return 'No Forecast';
  }
}

String getRive(int code) {
  if (code == 0) {
    return "assets/Rive/clear_sky.riv";
  } else if (code == 1) {
    return "assets/Rive/main.riv";
  } else if (code == 2) {
    return "assets/Rive/partly.riv";
  } else if (code == 3 || code >= 45 && code <= 48) {
    return "assets/Rive/overcast.riv";
  } else if (code >= 51 && code <= 67) {
    return "assets/Rive/rain.riv";
  } else {
    return 'No Forecast';
  }
}
