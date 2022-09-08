import 'dart:convert';

import 'package:dio/dio.dart';

import '../dto/store_dto.dart';

class StoreApi {
  final dio = Dio();

  Future<StoreDto> getStoresInfo() async {
    final response = await dio.get(
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json');

    return StoreDto.fromJson(jsonDecode(response.data));
  }
}
