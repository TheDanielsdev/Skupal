// To parse this JSON data, do
//
//     final creatUser = creatUserFromJson(jsonString);

import 'dart:convert';

CreatUser creatUserFromJson(String str) => CreatUser.fromJson(json.decode(str));

String creatUserToJson(CreatUser data) => json.encode(data.toJson());

class CreatUser {
  CreatUser({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory CreatUser.fromJson(Map<String, dynamic> json) => CreatUser(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic>? json) => Data();

  Map<String, dynamic> toJson() => {};
}
