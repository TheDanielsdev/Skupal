import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skupal/models/basic_api_res.dart';
import 'package:skupal/models/create_user_res.dart';
import 'package:skupal/models/login_user.dart';
import 'package:skupal/models/profile_completeness.dart';
import 'package:skupal/models/skills_model.dart';
import 'package:skupal/models/user.dart';
import 'package:skupal/services/api_service.dart';

import '../models/get_skills.dart';
import '../models/login_user.dart';
import '../models/user.dart';
import 'api_service.dart';

final skupalRepoProvider = Provider<SkupalRepo>((ref) => SkupalRepo(ref));
final authTokenProvider = StateProvider<String>((ref) => "");

final loginProvider =
    FutureProvider.family<LogUser, Map<String, dynamic>>((ref, arg) {
  final repo = ref.watch(skupalRepoProvider);
  return repo.login(arg["email"], arg["password"]);
});

//A provider that asynchronously exposes the current user
final userProvider = FutureProvider<UserResult>((ref) async {
  String authToken = ref.read(authTokenProvider);
  final repo = ref.read(skupalRepoProvider);
  return await repo.getUser(authToken);
});

final pofileCompletion = FutureProvider<ProfileCompletion>((ref) async {
  String authToken = ref.read(authTokenProvider);
  final repo = ref.read(skupalRepoProvider);
  return await repo.getProfComp(authToken);
});

class SkupalRepo {
  late final SkupalApiService _apiService;
  ProviderRef _ref;
  SkupalRepo(this._ref) {
    _apiService = _ref.watch(skupalApiServiceProvider);
  }

  Future<LogUser> login(String? email, String? password) async {
    return await _apiService
        .login(jsonEncode({"email": email, "password": password}));
  }

  Future<CreateUserResult> createUser(String? email, String? password) async {
    return await _apiService
        .createUser(jsonEncode({"email": email, "password": password}));
  }

  Future<UserResult> getUser(String authToken) async {
    return await _apiService.getUser(authToken);
  }

  Future<ProfileCompletion> getProfComp(String authToken) async {
    return await _apiService.getProfileComp(authToken);
  }

  Future<GetSkills> getSkills(String authToken) async {
    return await _apiService.getAllSkills(authToken);
  }

  Future<BasicResponse> sendVerificationCode(String? email) async {
    return await _apiService.resendCode(jsonEncode({"email": email}));
  }

  Future<BasicResponse> verifyCode(String? email, String? code) async {
    return _apiService.verifyCode(jsonEncode({"email": email, "token": code}));
  }

  Future<BasicResponse> forgotPassword(String? email) async {
    return _apiService.forgotPwd({"email": email});
  }

  Future<AddSkill> addSkill(
      String? name, String? expertise, String? skillId) async {
    return _apiService
        .addSkills({"name": name, "expertise": expertise, "skillId": skillId});
  }
}

class ToDo {
  int id;
  String des;
  ToDo({required this.des, required this.id});
}

class TT extends StateNotifier<List<ToDo>> {
  TT() : super([]);
}
