// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

List<UserDataModel> userDataModelFromJson(String str) =>
    List<UserDataModel>.from(
        json.decode(str).map((x) => UserDataModel.fromJson(x)));

String userDataModelToJson(List<UserDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDataModel {
  UserDataModel({
    required this.vpnname,
    required this.country,
    required this.ipaddress,
    required this.date,
    required this.ipno,
  });

  String vpnname;
  String country;
  String ipaddress;
  DateTime date;
  int ipno;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        vpnname: json["vpnname"],
        country: json["country"],
        ipaddress: json["ipaddress"],
        date: DateTime.parse(json["date"]),
        ipno: json["ipno"],
      );

  Map<String, dynamic> toJson() => {
        "vpnname": vpnname,
        "country": country,
        "ipaddress": ipaddress,
        "date": date.toString(),
        "ipno": ipno,
      };
}
