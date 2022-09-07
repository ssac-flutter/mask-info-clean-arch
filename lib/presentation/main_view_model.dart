import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/model/store.dart';
import '../domain/use_case/get_near_by_stores_use_case.dart';

part '../generated/presentation/main_view_model.freezed.dart';
part '../generated/presentation/main_view_model.g.dart';

class MainViewModel with ChangeNotifier {
  final GetNearByStoresUseCase _getNearByStoresUseCase;

  MainState _state = const MainState();

  MainState get state => _state;

  MainViewModel(this._getNearByStoresUseCase);

  void getStores() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final stores = await _getNearByStoresUseCase();
    _state = state.copyWith(
      stores: stores,
      isLoading: false,
    );
    notifyListeners();
  }
}

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default([]) List<Store> stores,
    @Default(false) bool isLoading,
  }) = _MainState;

  factory MainState.fromJson(Map<String, Object?> json) =>
      _$MainStateFromJson(json);
}
