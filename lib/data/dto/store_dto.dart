class StoreDto {
  StoreDto({
      this.count, 
      this.stores,});

  StoreDto.fromJson(dynamic json) {
    count = json['count'];
    if (json['stores'] != null) {
      stores = [];
      json['stores'].forEach((v) {
        stores?.add(Stores.fromJson(v));
      });
    }
  }
  num? count;
  List<Stores>? stores;
StoreDto copyWith({  num? count,
  List<Stores>? stores,
}) => StoreDto(  count: count ?? this.count,
  stores: stores ?? this.stores,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    if (stores != null) {
      map['stores'] = stores?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Stores {
  Stores({
      this.addr, 
      this.code, 
      this.createdAt, 
      this.lat, 
      this.lng, 
      this.name, 
      this.remainStat, 
      this.stockAt, 
      this.type,});

  Stores.fromJson(dynamic json) {
    addr = json['addr'];
    code = json['code'];
    createdAt = json['created_at'];
    lat = json['lat'];
    lng = json['lng'];
    name = json['name'];
    remainStat = json['remain_stat'];
    stockAt = json['stock_at'];
    type = json['type'];
  }
  String? addr;
  String? code;
  String? createdAt;
  num? lat;
  num? lng;
  String? name;
  String? remainStat;
  String? stockAt;
  String? type;
Stores copyWith({  String? addr,
  String? code,
  String? createdAt,
  num? lat,
  num? lng,
  String? name,
  String? remainStat,
  String? stockAt,
  String? type,
}) => Stores(  addr: addr ?? this.addr,
  code: code ?? this.code,
  createdAt: createdAt ?? this.createdAt,
  lat: lat ?? this.lat,
  lng: lng ?? this.lng,
  name: name ?? this.name,
  remainStat: remainStat ?? this.remainStat,
  stockAt: stockAt ?? this.stockAt,
  type: type ?? this.type,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addr'] = addr;
    map['code'] = code;
    map['created_at'] = createdAt;
    map['lat'] = lat;
    map['lng'] = lng;
    map['name'] = name;
    map['remain_stat'] = remainStat;
    map['stock_at'] = stockAt;
    map['type'] = type;
    return map;
  }

}