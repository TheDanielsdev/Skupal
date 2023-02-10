// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogUser _$LogUserFromJson(Map<String, dynamic> json) => LogUser(
      status: json['status'] as String?,
      message: json['message'] as String?,
      auth_token: json['auth_token'] as String?,
    );

Map<String, dynamic> _$LogUserToJson(LogUser instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'auth_token': instance.auth_token,
    };
