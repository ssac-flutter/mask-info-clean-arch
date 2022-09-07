import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/domain/model/store.freezed.dart';

part '../../generated/domain/model/store.g.dart';

@freezed
class Store with _$Store {
  const factory Store({
    required String address,
    required num lat,
    required num lng,
    required String name,
    required String remainStatus,
    double? distance,
  }) = _Store;

  factory Store.fromJson(Map<String, Object?> json) => _$StoreFromJson(json);
}