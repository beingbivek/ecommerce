import 'package:ecommerce/constant/constant.dart';
import 'package:ecommerce/service/networking.dart';
import 'package:location/location.dart';

Location location = new Location();

bool _serviceEnabled = false;
PermissionStatus _permissionGranted = PermissionStatus.denied;

Future<bool> isServiceEnabled() async {
  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
  }
  return _serviceEnabled;
}

Future<PermissionStatus> getPermissionStatus() async {
  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return _permissionGranted;
    }
  }
  return _permissionGranted;
}

// Future<LocationData> getLocationData() async {
//   return await location.getLocation();
// }

Future<dynamic> getCityName() async {
  try {
    var locator = await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${locator.latitude}&lon=${locator.longitude}&appid=$apiKey&units=metric');
    dynamic cityDetails = await networkHelper.getData();
    return cityDetails['name'];
  } catch (e) {
    return 'No Internet and problem is' + '$e';
  }
}
