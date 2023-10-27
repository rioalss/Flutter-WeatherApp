class WeatherModel {
    int? latitude;
    int? longitude;
    double? generationtimeMs;
    int? utcOffsetSeconds;
    String? timezone;
    String? timezoneAbbreviation;
    int? elevation;
    DailyUnits? dailyUnits;
    Daily? daily;

    WeatherModel({this.latitude, this.longitude, this.generationtimeMs, this.utcOffsetSeconds, this.timezone, this.timezoneAbbreviation, this.elevation, this.dailyUnits, this.daily});

    WeatherModel.fromJson(Map<String, dynamic> json) {
        latitude = (json["latitude"] as num).toInt();
        longitude = (json["longitude"] as num).toInt();
        generationtimeMs = (json["generationtime_ms"] as num).toDouble();
        utcOffsetSeconds = (json["utc_offset_seconds"] as num).toInt();
        timezone = json["timezone"];
        timezoneAbbreviation = json["timezone_abbreviation"];
        elevation = (json["elevation"] as num).toInt();
        dailyUnits = json["daily_units"] == null ? null : DailyUnits.fromJson(json["daily_units"]);
        daily = json["daily"] == null ? null : Daily.fromJson(json["daily"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["latitude"] = latitude;
        _data["longitude"] = longitude;
        _data["generationtime_ms"] = generationtimeMs;
        _data["utc_offset_seconds"] = utcOffsetSeconds;
        _data["timezone"] = timezone;
        _data["timezone_abbreviation"] = timezoneAbbreviation;
        _data["elevation"] = elevation;
        if(dailyUnits != null) {
            _data["daily_units"] = dailyUnits?.toJson();
        }
        if(daily != null) {
            _data["daily"] = daily?.toJson();
        }
        return _data;
    }
}

class Daily {
    List<String>? time;
    List<int>? weathercode;
    List<double>? apparentTemperatureMax;

    Daily({this.time, this.weathercode, this.apparentTemperatureMax});

    Daily.fromJson(Map<String, dynamic> json) {
        time = json["time"] == null ? null : List<String>.from(json["time"]);
        weathercode = json["weathercode"] == null ? null : List<int>.from(json["weathercode"]);
        apparentTemperatureMax = json["apparent_temperature_max"] == null ? null : List<double>.from(json["apparent_temperature_max"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(time != null) {
            _data["time"] = time;
        }
        if(weathercode != null) {
            _data["weathercode"] = weathercode;
        }
        if(apparentTemperatureMax != null) {
            _data["apparent_temperature_max"] = apparentTemperatureMax;
        }
        return _data;
    }
}

class DailyUnits {
    String? time;
    String? weathercode;
    String? apparentTemperatureMax;

    DailyUnits({this.time, this.weathercode, this.apparentTemperatureMax});

    DailyUnits.fromJson(Map<String, dynamic> json) {
        time = json["time"];
        weathercode = json["weathercode"];
        apparentTemperatureMax = json["apparent_temperature_max"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["time"] = time;
        _data["weathercode"] = weathercode;
        _data["apparent_temperature_max"] = apparentTemperatureMax;
        return _data;
    }
}