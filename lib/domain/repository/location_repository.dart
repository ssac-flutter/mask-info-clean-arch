import '../model/location.dart';

abstract class LocationRepository {
  Future<Location> getLocation();
}