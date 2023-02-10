// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserResult _$CreateUserResultFromJson(Map<String, dynamic> json) =>
    CreateUserResult(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateUserResultToJson(CreateUserResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
