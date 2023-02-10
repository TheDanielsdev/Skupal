import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'create_user_res.g.dart';

CreateUserResult creatUserFromJson(String str) =>
    CreateUserResult.fromJson(json.decode(str));

String creatUserToJson(CreateUserResult data) => json.encode(data.toJson());

@JsonSerializable()
class CreateUserResult {
  String? status;
  String? message;
  Data? data;

  CreateUserResult({
    this.status,
    this.message,
    this.data,
  });

  factory CreateUserResult.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResultFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserResultToJson(this);
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
