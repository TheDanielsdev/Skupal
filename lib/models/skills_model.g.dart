// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skills_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddSkill _$AddSkillFromJson(Map<String, dynamic> json) => AddSkill(
      status: json['status'] as String,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddSkillToJson(AddSkill instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
