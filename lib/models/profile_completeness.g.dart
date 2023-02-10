// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_completeness.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileCompletion _$ProfileCompletionFromJson(Map<String, dynamic> json) =>
    ProfileCompletion(
      status: json['status'] as String?,
      data: (json['data'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProfileCompletionToJson(ProfileCompletion instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
