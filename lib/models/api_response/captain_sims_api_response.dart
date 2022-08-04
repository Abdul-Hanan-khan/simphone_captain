import '../data_models/sim.dart';

class CaptainSimsApiResponse {
  CaptainSimsApiResponse({
      bool? result, 
      String? message, 
      List<Sims>? sims,}){
    _result = result;
    _message = message;
    _sims = sims;
}

  CaptainSimsApiResponse.fromJson(dynamic json) {
    _result = json['result'];
    _message = json['message'];
    if (json['sims'] != null) {
      _sims = [];
      json['sims'].forEach((v) {
        _sims?.add(Sims.fromJson(v));
      });
    }
  }
  bool? _result;
  String? _message;
  List<Sims>? _sims;

  bool? get result => _result;
  String? get message => _message;
  List<Sims>? get sims => _sims;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['message'] = _message;
    if (_sims != null) {
      map['sims'] = _sims?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class Franchise {
  Franchise({
      String? id, 
      String? name, 
      String? email, 
      int? phone, 
      String? address,}){
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _address = address;
}

  Franchise.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _address = json['address'];
  }
  String? _id;
  String? _name;
  String? _email;
  int? _phone;
  String? _address;

  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  int? get phone => _phone;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['address'] = _address;
    return map;
  }

}