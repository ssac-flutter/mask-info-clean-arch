import 'package:mask_info/domain/model/permission.dart';
import 'package:mask_info/domain/repository/location_permission_repository.dart';

import '../domain/model/location.dart';
import '../domain/model/store.dart';
import '../domain/repository/location_repository.dart';
import '../domain/repository/store_repository.dart';

class MockStoreRepository implements StoreRepository {
  @override
  Future<List<Store>> getStores() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      ...List.generate(
        222,
        (index) => const Store(
          address: 'address',
          lat: 3.3,
          lng: 4,
          name: '승약국',
          remainStatus: 'remainStatus',
        ),
      ),
    ];
  }
}

class MockNearbyStoreRepository implements StoreRepository {
  @override
  Future<List<Store>> getStores() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      const Store(
        address: 'address',
        lat: 37.2680,
        lng: 127.0001,
        name: '수원약국',
        remainStatus: 'remainStatus',
      ),
      const Store(
        address: 'address',
        lat: 37.3999,
        lng: 126.9236,
        name: '안양약국',
        remainStatus: 'remainStatus',
      ),
      const Store(
        address: 'address',
        lat: 36.9929,
        lng: 127.0870,
        name: '평택약국',
        remainStatus: 'remainStatus',
      ),
    ];
  }
}

class MockLocationRepository implements LocationRepository {
  @override
  Future<Location> getLocation() async {
    return Location(37.5177, 126.8864);
  }

  @override
  double distanceBetween(
      double startLat, double startLng, double endLat, double endLng) {
    return 0.0;
  }
}

class MockLocationPermissionRepositoryImpl
    implements LocationPermissionRepository {
  @override
  Future<Permission> checkPermission() async {
    return Permission.always;
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return true;
  }

  @override
  Future<Permission> requestPermission() async {
    return Permission.always;
  }
}
