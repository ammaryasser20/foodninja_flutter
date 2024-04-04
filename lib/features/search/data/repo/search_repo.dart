import 'package:dio/dio.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/network/api_error_handler.dart';
import 'package:foodninja/core/network/api_result.dart';
import 'package:foodninja/core/network/api_service.dart';
import 'package:foodninja/features/home/data/models/food.dart';
import 'package:foodninja/features/home/data/models/restaurant.dart';

class SearchRepo {
  SearchRepo(
    this._apiService,
  );
  final ApiService _apiService;
  Future<ApiResult<AllFood>> searchForFood(String name, String token) async {
    try {
      final response = await _apiService.searchFoodByName('Bearer $token', name);
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
    Future<ApiResult<AllRestaurant>> searchRestaurant(String name, String token) async {
    try {
      final response = await _apiService.searchRestaurantByName('Bearer $token', name);
      return ApiResult.success(response);
    } on DioException catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  } Future<AllRestaurant?> getOneRestaurant(String restaurantID) async {
    try {
      final data = await _apiService.getRestaurantByID(
          'Bearer ${CashHelper.getString(key: Keys.token)}', restaurantID);
      return data;
    } catch (e) {
      return null;
    }
  }
}
