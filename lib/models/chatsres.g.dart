// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatsres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatsRes _$ChatsResFromJson(Map<String, dynamic> json) => ChatsRes(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatsResToJson(ChatsRes instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      senderId: json['senderId'] as String?,
      contractId: json['contractId'] as String?,
      message: json['message'] as String?,
      key: json['key'] as String?,
      senderType: json['senderType'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['v'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'senderId': instance.senderId,
      'contractId': instance.contractId,
      'message': instance.message,
      'key': instance.key,
      'senderType': instance.senderType,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };
