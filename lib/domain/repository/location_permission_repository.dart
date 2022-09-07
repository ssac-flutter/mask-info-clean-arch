import 'package:mask_info/domain/model/permission.dart';

abstract class LocationPermissionRepository {
  Future<bool> isLocationServiceEnabled();

  Future<Permission> checkPermission();

  Future<Permission> requestPermission();
}
