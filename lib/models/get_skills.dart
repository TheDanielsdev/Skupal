// To parse this JSON data, do
//
//     final getSkills = getSkillsFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'get_skills.g.dart';

GetSkills getSkillsFromJson(String str) => GetSkills.fromJson(json.decode(str));

String getSkillsToJson(GetSkills data) => json.encode(data.toJson());

@JsonSerializable()
class GetSkills {
  GetSkills({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<Datum> data;
  factory GetSkills.fromJson(Map<String, dynamic> json) =>
      _$GetSkillsFromJson(json);

  Map<String, dynamic> toJson() => _$GetSkillsToJson(this);
}

class Datum {
  Datum({
    required this.id,
    required this.skillId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String skillId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        skillId: json["skillId"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "skillId": skillId,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
