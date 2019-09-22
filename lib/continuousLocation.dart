import 'dart:async';
import 'package:geolocator/geolocator.dart';

class ContinuousLocation {
  double latitude;
  double longitude;
  var geolocator = Geolocator();
  StreamSubscription<Position> positionStream;

  Future<void> startGettingLocation() async {
    try {
      var locationOptions = LocationOptions(accuracy: LocationAccuracy.high);
      positionStream = geolocator
          .getPositionStream(locationOptions)
          .listen((Position position) {
        if (position != null) {
          latitude = position.latitude;
          longitude = position.longitude;
          print("${latitude.toString()}, ${longitude.toString()}");
        }
      });
    } catch (exception) {
      print(exception);
    }
  }

  endGettinglocation(){
    positionStream.cancel();
  }
}
