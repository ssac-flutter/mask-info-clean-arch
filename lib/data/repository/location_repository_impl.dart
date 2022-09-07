import 'package:geolocator/geolocator.dart';
import 'package:mask_info/domain/model/location.dart';
import 'package:mask_info/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<Location> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print('=====================');
    print(position.toString());
    print('=====================');

    return Location(position.latitude, position.longitude);
  }

  @override
  double distanceBetween(
      double startLat, double startLng, double endLat, double endLng) {
    return Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
  }
}
