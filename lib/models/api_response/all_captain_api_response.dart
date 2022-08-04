class AllFranchiseApiResponse {
  AllFranchiseApiResponse({
      bool? result, 
      String? message, 
      List<Franchises>? franchises,}){
    _result = result;
    _message = message;
    _franchises = franchises;
}

  AllFranchiseApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['franchises'] != null) {
      _franchises = [];
      json['franchises'].forEach((v) {
        _franchises?.add(Franchises.fromJson(v));
      });
    }
  }
  bool? _result;
  String? _message;
  List<Franchises>? _franchises;

  bool? get result => _result;
  String? get message => _message;
  List<Franchises>? get franchises => _franchises;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_franchises != null) {
      map['franchises'] = _franchises?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Franchises {
  Franchises({
      String? id, 
      String? name, 
      String? email, 
      String? phone, 
      String? status, 
      String? address, 
      String? role, 
      List<Inventory>? inventory, 
      int? v, 
      int? percentage, 
      double? long, 
      double? lat,}){
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _status = status;
    _address = address;
    _role = role;
    _inventory = inventory;
    _v = v;
    _percentage = percentage;
    _long = long;
    _lat = lat;
}

  Franchises.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _status = json['status'];
    _address = json['address'];
    _role = json['role'];
    if (json['inventory'] != null) {
      _inventory = [];
      json['inventory'].forEach((v) {
        _inventory?.add(Inventory.fromJson(v));
      });
    }
    _v = json['__v'];
    _percentage = json['percentage'];
    _long = json['long'];
    _lat = json['lat'];
  }
  String? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _status;
  String? _address;
  String? _role;
  List<Inventory>? _inventory;
  int? _v;
  int? _percentage;
  double? _long;
  double? _lat;

  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  String? get status => _status;
  String? get address => _address;
  String? get role => _role;
  List<Inventory>? get inventory => _inventory;
  int? get v => _v;
  int? get percentage => _percentage;
  double? get long => _long;
  double? get lat => _lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['status'] = _status;
    map['address'] = _address;
    map['role'] = _role;
    if (_inventory != null) {
      map['inventory'] = _inventory?.map((v) => v.toJson()).toList();
    }
    map['__v'] = _v;
    map['percentage'] = _percentage;
    map['long'] = _long;
    map['lat'] = _lat;
    return map;
  }

}

class Inventory {
  Inventory({
      String? id, 
      String? deviceType, 
      String? name, 
      int? price, 
      List<String>? pics, 
      int? qty,}){
    _id = id;
    _deviceType = deviceType;
    _name = name;
    _price = price;
    _pics = pics;
    _qty = qty;
}

  Inventory.fromJson(dynamic json) {
    _id = json['_id'];
    _deviceType = json['deviceType'];
    _name = json['name'];
    _price = json['price'];
    _pics = json['pics'] != null ? json['pics'].cast<String>() : [];
    _qty = json['qty'];
  }
  String? _id;
  String? _deviceType;
  String? _name;
  int? _price;
  List<String>? _pics;
  int? _qty;

  String? get id => _id;
  String? get deviceType => _deviceType;
  String? get name => _name;
  int? get price => _price;
  List<String>? get pics => _pics;
  int? get qty => _qty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['deviceType'] = _deviceType;
    map['name'] = _name;
    map['price'] = _price;
    map['pics'] = _pics;
    map['qty'] = _qty;
    return map;
  }

}