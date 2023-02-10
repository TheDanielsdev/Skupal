// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_skills.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSkills _$GetSkillsFromJson(Map<String, dynamic> json) => GetSkills(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSkillsToJson(GetSkills instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
