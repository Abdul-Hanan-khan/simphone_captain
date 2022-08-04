

import 'package:sim_phone_captain/models/data_models/package.dart';

class Sims {
  Sims({
    String? id,
    String? network,
    String? numberType,
    String? simType,
    String? series,
    String? no,
    int? price,
    int? discountPrice,
    int? discount,
    bool? available,
    Package? package,
    int? v,}){
    _id = id;
    _network = network;
    _numberType = numberType;
    _simType = simType;
    _series = series;
    _no = no;
    _price = price;
    _discountPrice = discountPrice;
    _discount = discount;
    _available = available;
    _package = package;
    _v = v;
  }

  Sims.fromJson(dynamic json) {
    _id = json['_id'];
    _network = json['network'];
    _numberType = json['numberType'];
    _simType = json['simType'];
    _series = json['series'];
    _no = json['no'];
    _price = json['price'];
    _discountPrice = json['discountPrice'];
    _discount = json['discount'];
    _available = json['available'];
    _package = json['package'] != null ? Package.fromJson(json['package']) : null;
    _v = json['__v'];
  }
  String? _id;
  String? _network;
  String? _numberType;
  String? _simType;
  String? _series;
  String? _no;
  int? _price;
  int? _discountPrice;
  int? _discount;
  bool? _available;
  Package? _package;
  int? _v;

  String? get id => _id;
  String? get network => _network;
  String? get numberType => _numberType;
  String? get simType => _simType;
  String? get series => _series;
  String? get no => _no;
  int? get price => _price;
  int? get discountPrice => _discountPrice;
  int? get discount => _discount;
  bool? get available => _available;
  Package? get package => _package;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['network'] = _network;
    map['numberType'] = _numberType;
    map['simType'] = _simType;
    map['series'] = _series;
    map['no'] = _no;
    map['price'] = _price;
    map['discountPrice'] = _discountPrice;
    map['discount'] = _discount;
    map['available'] = _available;
    if (_package != null) {
      map['package'] = _package?.toJson();
    }
    map['__v'] = _v;
    return map;
  }

}