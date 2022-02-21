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

Future<LocationData>? getLocationData() async {
  return await location.getLocation();
}
