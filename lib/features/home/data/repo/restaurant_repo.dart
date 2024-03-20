import 'package:dio/dio.dart';
import 'package:foodninja/core/network/api_error_handler.dart';
import 'package:foodninja/core/network/api_result.dart';
import 'package:foodninja/core/network/api_service.dart';
import 'package:foodninja/features/home/data/models/food.dart';
import 'package:foodninja/features/home/data/models/restaurant.dart';

class RestaurantRepo {
  final ApiService _apiService;
  RestaurantRepo(this._apiService);

  Future<ApiResult<AllRestaurant>> getAllRestaurant(String token) async {
    try {
      final response = await _apiService.getAllRestaurants('Bearer $token');

      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AllFood>> getAllFood(String token) async {
    try {
      final response = await _apiService.getAllFood('Bearer $token');

      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
