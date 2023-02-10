// To parse this JSON data, do
//
//     final addSkill = addSkillFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'skills_model.g.dart';

AddSkill addSkillFromJson(String str) => AddSkill.fromJson(json.decode(str));

String addSkillToJson(AddSkill data) => json.encode(data.toJson());

@JsonSerializable()
class AddSkill {
  AddSkill({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  Data data;

  factory AddSkill.fromJson(Map<String, dynamic> json) =>
      _$AddSkillFromJson(json);

  Map<String, dynamic> toJson() => _$AddSkillToJson(this);
}

class Data {
  Data({
    required this.skillId,
    required this.name,
    required this.userId,
    required this.expertise,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String skillId;
  String name;
  String userId;
  String expertise;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        skillId: json["skillId"],
        name: json["name"],
        userId: json["userId"],
        expertise: json["expertise"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "skillId": skillId,
        "name": name,
        "userId": userId,
        "expertise": expertise,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
