class User {
  User({
    Location? location,
    String? id,
    String? name,
    int? cnic,
    String? email,
    String? phone,
    String? role,
    String? status,
    String? address,
    String? avatar,
    int? v,}){
    _location = location;
    _id = id;
    _name = name;
    _cnic = cnic;
    _email = email;
    _phone = phone;
    _role = role;
    _status = status;
    _address = address;
    _avatar = avatar;
    _v = v;
  }

  User.fromJson(dynamic json) {
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _id = json['_id'];
    _name = json['name'];
    _cnic = json['cnic'];
    _email = json['email'];
    _phone = json['phone'];
    _role = json['role'];
    _status = json['status'];
    _address = json['address'];
    _avatar = json['avatar'];
    _v = json['__v'];
  }
  Location? _location;
  String? _id;
  String? _name;
  int? _cnic;
  String? _email;
  String? _phone;
  String? _role;
  String? _status;
  String? _address;
  String? _avatar;
  int? _v;

  Location? get location => _location;
  String? get id => _id;
  String? get name => _name;
  int? get cnic => _cnic;
  String? get email => _email;
  String? get phone => _phone;
  String? get role => _role;
  String? get status => _status;
  String? get address => _address;
  String? get avatar => _avatar;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['_id'] = _id;
    map['name'] = _name;
    map['cnic'] = _cnic;
    map['email'] = _email;
    map['phone'] = _phone;
    map['role'] = _role;
    map['status'] = _status;
    map['address'] = _address;
    map['avatar'] = _avatar;
    map['__v'] = _v;
    return map;
  }

}

class Location {
  Location({
    String? type,
    List<double>? coordinates,}){
    _type = type;
    _coordinates = coordinates;
  }

  Location.fromJson(dynamic json) {
    _type = json['type'];
    _coordinates = json['coordinates'] != null ? json['coordinates'].cast<double>() : [];
  }
  String? _type;
  List<double>? _coordinates;

  String? get type => _type;
  List<double>? get coordinates => _coordinates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['coordinates'] = _coordinates;
    return map;
  }

}