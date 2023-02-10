import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class UserResult {
  String? status;
  User? data;

  UserResult({this.status, this.data});

  factory UserResult.fromJson(Map<String, dynamic> json) =>
      _$UserResultFromJson(json);

  Map<String, dynamic> toJson() => _$UserResultToJson(this);
}

@JsonSerializable()
class User {
  int? totalEarnings;
  String? sId;
  String? firstName;
  String? lastName;
  String? userName;
  String? dOB;
  String? phoneNumber;
  String? accountName;
  int? accountNumber;
  String? bank;
  String? email;
  List<String>? skills;
  List<String>? socialMediaLinks;
  String? password;
  String? status;
  String? confirmationCode;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.totalEarnings,
      this.sId,
      this.firstName,
      this.lastName,
      this.userName,
      this.dOB,
      this.phoneNumber,
      this.accountName,
      this.accountNumber,
      this.bank,
      this.email,
      this.skills,
      this.socialMediaLinks,
      this.password,
      this.status,
      this.confirmationCode,
      this.createdAt,
      this.updatedAt,
      this.iV});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
