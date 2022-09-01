// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../domain/model/store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$$_StoreFromJson(Map<String, dynamic> json) => _$_Store(
      address: json['address'] as String,
      lat: json['lat'] as num,
      lng: json['lng'] as num,
      name: json['name'] as String,
      remainStatus: json['remainStatus'] as String,
    );

Map<String, dynamic> _$$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'remainStatus': instance.remainStatus,
    };
