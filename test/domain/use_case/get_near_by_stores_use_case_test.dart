import 'package:flutter_test/flutter_test.dart';
import 'package:mask_info/data/mock_data.dart';
import 'package:mask_info/domain/use_case/get_near_by_stores_use_case.dart';

void main() {
  final useCase = GetNearByStoresUseCase(
    MockNearbyStoreRepository(),
    MockLocationRepository(),
  );

  test('가까운 순서대로 오름차순 정렬되어야 한다', () async {
    final stores = await useCase();

    expect(stores[0].name, '안양약국');
    expect(stores[1].name, '수원약국');
    expect(stores[2].name, '평택약국');
  });
}
