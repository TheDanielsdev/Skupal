import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:skupal/models/basic_api_res.dart';
import 'package:skupal/models/get_skills.dart';
import 'package:skupal/models/login_user.dart';
import 'package:skupal/models/profile_completeness.dart';
import 'package:skupal/models/skills_model.dart';
import 'package:skupal/models/user.dart';
import '../models/create_user_res.dart';
part 'api_service.g.dart';

const _BASE_URL = "https://skupal-api-v2.azurewebsites.net";

@RestApi(baseUrl: _BASE_URL)
abstract class SkupalApiService {
  factory SkupalApiService(Dio dio, {String baseUrl}) = _SkupalApiService;

  @GET("/user")
  Future<UserResult> getUser(@Header("Authorization") String token);

  @GET("/api/skill")
  Future<GetSkills> getAllSkills(@Header("Authorization") String token);

  @GET("/api/auth/profile_completeness")
  Future<ProfileCompletion> getProfileComp(
      @Header("Authorization") String token);

  @POST("/api/auth/login")
  Future<LogUser> login(@Body() emailNPassword);

  @POST("/api/auth")
  Future<CreateUserResult> createUser(@Body() emailNPassword);

  @POST("/api/auth/verify")
  Future<BasicResponse> verifyCode(@Body() code);

  @POST("/api/auth/resend_code")
  Future<BasicResponse> resendCode(@Body() email);

  @POST("/api/auth/forgot_password")
  Future<BasicResponse> forgotPwd(@Body() email);

  @POST("/api/skill/add")
  Future<AddSkill> addSkills(@Body() body);
}

final logger = Logger();

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options = BaseOptions(
      contentType: "application/json",
      connectTimeout: 5000,
      headers: {"Accept": "application/json"});
  dio..interceptors.add(ApiInterceptors());
  return dio;
});

final skupalApiServiceProvider = Provider<SkupalApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return SkupalApiService(dio);
});

class ApiInterceptors extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('requesting...');

    // do something before request is sent
    super.onRequest(options, handler);
  }

  @override
  Future<dynamic> onError(
      DioError dioError, ErrorInterceptorHandler handler) async {
    //handler.next(dioError);
    var res = dioError.response;
    logger.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
    // do something to error
    super.onError(dioError, handler);
  }

  @override
  Future<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    print(response.statusCode);
    print('done');
    logger.i("Done : ${response.statusCode} -> ${response.statusMessage}");
    // do something before response
    super.onResponse(response, handler);
  }
}
