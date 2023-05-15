import 'dart:convert';

class Data {
  String? id;
  String type;
  String email;

  Data({this.id, required this.type, required this.email});

  // Factory constructor to instantiate object from json format
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      type: json['type'],
      email: json['email'],
    );
  }

  static List<Data> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Data>((dynamic d) => Data.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Data data) {
    return {
      'type': data.type,
    };
  }
}
