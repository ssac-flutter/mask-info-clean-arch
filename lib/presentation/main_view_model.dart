import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:mask_info/domain/repository/store_repository.dart';
import '../domain/model/store.dart';

part '../generated/presentation/main_view_model.freezed.dart';

part '../generated/presentation/main_view_model.g.dart';

class MainViewModel with ChangeNotifier {
  final StoreRepository _repository;

  MainState _state = const MainState();

  MainState get state => _state;

  MainViewModel(this._repository) {
    getStores();
  }

  void getStores() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final stores = await _repository.getStores();
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
