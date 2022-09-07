import 'package:flutter_test/flutter_test.dart';
import 'package:mask_info/data/mock_data.dart';
import 'package:mask_info/domain/model/store.dart';
import 'package:mask_info/domain/use_case/get_near_by_stores_use_case.dart';
import 'package:mask_info/presentation/main_view_model.dart';

void main() {
  late MainViewModel viewModel;

  test('약국 정보는 222개 여야 한다', () async {
    final useCase = GetNearByStoresUseCase(
      MockStoreRepository(),
      MockLocationRepository(),
    );
    viewModel = MainViewModel(useCase);

    viewModel.getStores();
    await Future.delayed(Duration(seconds: 3));

    final actual = viewModel.state.stores.length;
    final expected = List.generate(
        222,
        (index) => Store(
              address: 'address',
              lat: 3.3,
              lng: 4,
              name: 'name',
              remainStatus: 'remainStatus',
            )).length;

    expect(actual, expected);
  });

  test('첫번째 약국은 승약국이다', () async {
    final useCase = GetNearByStoresUseCase(
      MockStoreRepository(),
      MockLocationRepository(),
    );
    viewModel = MainViewModel(useCase);

    viewModel.getStores();
    await Future.delayed(Duration(seconds: 3));

    final actual = viewModel.state.stores.first.name;
    final expected = '승약국';

    expect(actual, expected);
  });
}
