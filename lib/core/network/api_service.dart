import 'package:dio/dio.dart';
import 'package:foodninja/core/network/api_constants.dart';
import 'package:foodninja/features/login/data/models/login_request_body.dart';
import 'package:foodninja/features/login/data/models/login_response.dart';
import 'package:foodninja/features/sign_up/data/models/register_request_body.dart';
import 'package:foodninja/features/sign_up/data/models/register_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
  @POST(ApiConstants.signUp)
  Future<RegisterResponse> register(@Body() RegisterRequestBody registerRequestBody);
}
