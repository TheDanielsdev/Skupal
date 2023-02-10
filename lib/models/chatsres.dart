import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part "chatsres.g.dart";

@JsonSerializable()
class ChatsRes {
  String? status;
  String? message;
  Data? data;

  ChatsRes({
    this.status,
    this.message,
    this.data,
  });
  factory ChatsRes.fromJson(Map<String, dynamic> json) =>
      _$ChatsResFromJson(json);

  Map<String, dynamic> toJson() => _$ChatsResToJson(this);
}

@JsonSerializable()
class Data {
  String? senderId;
  String? contractId;
  String? message;
  String? key;
  String? senderType;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  Data({
    this.senderId,
    this.contractId,
    this.message,
    this.key,
    this.senderType,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
