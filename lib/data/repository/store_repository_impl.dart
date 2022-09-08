import 'package:mask_info/domain/model/store.dart';
import 'package:mask_info/domain/repository/store_repository.dart';

import '../data_source/store_api.dart';

class StoreRepositoryImpl implements StoreRepository {
  final _api = StoreApi();

  @override
  Future<List<Store>> getStores() async {
    final dto = await _api.getStoresInfo();

    if (dto.stores == null) {
      return [];
    }

    return dto.stores!
        .where((element) => element.name != null)
        .map((e) => Store(
              address: e.addr ?? '',
              lat: e.lat ?? 0.0,
              lng: e.lng ?? 0.0,
              name: e.name ?? '이름 없음',
              remainStatus: e.remainStat ?? '알 수 없음',
            ))
        .toList();
  }
}
