import 'package:geolocator/geolocator.dart';
import 'package:mask_info/domain/repository/location_repository.dart';
import 'package:mask_info/domain/repository/store_repository.dart';

import '../model/store.dart';

class GetNearByStoresUseCase {
  final StoreRepository _storeRepository;
  final LocationRepository _locationRepository;

  GetNearByStoresUseCase(
    this._storeRepository,
    this._locationRepository,
  );

  Future<List<Store>> call() async {
    final stores = await _storeRepository.getStores();

    // 기기의 위치 서비스 확인
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    // 권한 체크
    if (serviceEnabled) {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        // 요청
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          // 거부
          print('거부');
          return stores;
        }

      }

      if (permission == LocationPermission.deniedForever) {
        // 2번 거부
        print('2번 거부');
        // Permissions are denied forever, handle appropriately.
        return stores;
      }

      final location = await _locationRepository.getLocation();

      return stores.map((store) {
        return store.copyWith(
          distance: Geolocator.distanceBetween(
            store.lat.toDouble(),
            store.lng.toDouble(),
            location.latitude,
            location.longitude,
          ),
        );
      }).toList()
        ..sort((a, b) => a.distance!.compareTo(b.distance!));
    }

    return stores;
  }
}
