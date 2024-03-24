import 'package:dio/dio.dart';
import 'package:foodninja/core/network/api_constants.dart';
import 'package:foodninja/features/home/data/models/food.dart';
import 'package:foodninja/features/home/data/models/restaurant.dart';
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
  Future<RegisterResponse> register(
      @Body() RegisterRequestBody registerRequestBody);
  @GET(ApiConstants.restaurant)
  Future<AllRestaurant> getAllRestaurants(
      @Header('Authorization') String token);
  @GET(ApiConstants.food)
  Future<AllFood> getAllFood(@Header('Authorization') String token);
  @GET("${ApiConstants.food}/{id}")
  Future<AllFood> getFoodByID(
      @Header('Authorization') String token, @Path("id") int id);
  @GET("${ApiConstants.restaurant}/{id}")
  Future<AllRestaurant> getRestaurantByID(
      @Header('Authorization') String token, @Path("id") String id);
}
