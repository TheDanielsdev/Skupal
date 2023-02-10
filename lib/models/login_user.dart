import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'login_user.g.dart';

LogUser logUserFromJson(String str) => LogUser.fromJson(json.decode(str));

String logUserToJson(LogUser data) => json.encode(data.toJson());

@JsonSerializable()
class LogUser {
  String? status;
  String? message;
  final String? auth_token;

  LogUser({
    this.status,
    this.message,
    this.auth_token,
  });

  factory LogUser.fromJson(Map<String, dynamic> json) =>
      _$LogUserFromJson(json);

  Map<String, dynamic> toJson() => _$LogUserToJson(this);
}
