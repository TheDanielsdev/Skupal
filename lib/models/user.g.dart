// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResult _$UserResultFromJson(Map<String, dynamic> json) => UserResult(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResultToJson(UserResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      totalEarnings: json['totalEarnings'] as int?,
      sId: json['sId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      userName: json['userName'] as String?,
      dOB: json['dOB'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      accountName: json['accountName'] as String?,
      accountNumber: json['accountNumber'] as int?,
      bank: json['bank'] as String?,
      email: json['email'] as String?,
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      socialMediaLinks: (json['socialMediaLinks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      password: json['password'] as String?,
      status: json['status'] as String?,
      confirmationCode: json['confirmationCode'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      iV: json['iV'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'totalEarnings': instance.totalEarnings,
      'sId': instance.sId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'dOB': instance.dOB,
      'phoneNumber': instance.phoneNumber,
      'accountName': instance.accountName,
      'accountNumber': instance.accountNumber,
      'bank': instance.bank,
      'email': instance.email,
      'skills': instance.skills,
      'socialMediaLinks': instance.socialMediaLinks,
      'password': instance.password,
      'status': instance.status,
      'confirmationCode': instance.confirmationCode,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
    };
