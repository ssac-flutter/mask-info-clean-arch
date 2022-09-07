import 'package:geolocator/geolocator.dart';
import 'package:mask_info/domain/model/permission.dart';
import 'package:mask_info/domain/repository/location_permission_repository.dart';

class LocationPermissionRepositoryImpl implements LocationPermissionRepository {
  @override
  Future<Permission> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    switch (permission) {
      case LocationPermission.unableToDetermine:
      case LocationPermission.denied:
        return Permission.denied;
      case LocationPermission.deniedForever:
        return Permission.deniedForever;
      case LocationPermission.whileInUse:
      case LocationPermission.always:
        return Permission.always;
    }
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<Permission> requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();

    switch (permission) {
      case LocationPermission.unableToDetermine:
      case LocationPermission.denied:
        return Permission.denied;
      case LocationPermission.deniedForever:
        return Permission.deniedForever;
      case LocationPermission.whileInUse:
      case LocationPermission.always:
        return Permission.always;
    }
  }
}
