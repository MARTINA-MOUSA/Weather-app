class WeatherModel {
  final String date;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weatherCondition;
  final String cityName;
  final String? image;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherCondition,
      required this.cityName,
      required this.image});
  factory WeatherModel.fromjson(json) {
    //  temp = jasonData['avgtemp_c'];
    // Maxtemp = jasonData['maxtemp_c'];
    // Mintemp = jasonData['mintemp_c'];
    // weatherStateName = jasonData['condition']['text'];
    return WeatherModel(
      date: json['current']['last_updated'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: 30.5,
      mintemp:json['forecast']['forecastday'][0]['day'] ['mintemp_c'],
      weatherCondition:json['forecast']['forecastday'][0]['day']['condition']['text'],
      cityName:json['location']['name'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
