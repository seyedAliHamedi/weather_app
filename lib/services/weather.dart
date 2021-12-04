import 'networking.dart';
import 'location.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Uri url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=eba1dc5417d808145660fe81be84c562&units=metric');
    NetworkHelper network = NetworkHelper(
      url: url,
    );

    var data = await network.getData();
    return data;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    Uri url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=eba1dc5417d808145660fe81be84c562&units=metric');
    NetworkHelper network = NetworkHelper(
      url: url,
    );

    var data = await network.getData();
    return data;
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
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
