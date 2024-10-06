String getshape(String s) {
  if (s == 'Sunny') {
    return 'assets/images/clear.png';
  } else if (s == "Patchy rain nearby") {
    return 'assets/images/cloudy.png';
  } else if (s == 'overcast') {
    return 'assets/images/snow.png';
  } else if (s == "Heavy rain") {
    return "assets/images/rainy.png";
  } else {
    return "assets/images/thunderstorm.png";
  }
}
