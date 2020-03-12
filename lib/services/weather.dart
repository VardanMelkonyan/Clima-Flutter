import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  Future getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$kApiKey&units=metric';
    var networkHelper = Networking(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future getLocationWeather() async {
    var location = Location();
    await location.getCurrentLocation();

    var networkHelper = Networking(
        '$openWeatherMapURL?units=metric&appid=$kApiKey&lat=${location.latitude}&lon=${location.longitude}');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 7) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
