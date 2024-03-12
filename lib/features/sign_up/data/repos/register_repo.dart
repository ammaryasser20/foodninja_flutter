import 'package:dio/dio.dart';
import 'package:foodninja/core/network/api_error_handler.dart';
import 'package:foodninja/core/network/api_result.dart';
import 'package:foodninja/core/network/api_service.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/sign_up/data/models/register_request_body.dart';
import 'package:foodninja/features/sign_up/data/models/register_response.dart';

class RegisterRepo {
  final ApiService _apiService;
  RegisterRepo(this._apiService);
  Future<ApiResult<RegisterResponse>> register(
      RegisterRequestBody registerRequestBody) async {
    try {
      final response = await _apiService.register(registerRequestBody);

      if (response.status == false) {
        return ApiResult.failure(
          ErrorHandler.handle("non",
              message: AppStrings.theEmailHasAlreadyBeenTaken),
        );
      } else {
        return ApiResult.success(response);
      }
    } on DioException catch (error) {
      if (error.response!.data["status"] == false && error.response != null) {
        if (error.response!.data["massege"] != null) {
          return ApiResult.failure(
            ErrorHandler.handle("non",
                message: AppStrings.theEmailHasAlreadyBeenTaken),
          );
        } else {
          return ApiResult.failure(ErrorHandler.handle(error));
        }
      } else {
        return ApiResult.failure(ErrorHandler.handle(error));
      }
    }
  }
}
