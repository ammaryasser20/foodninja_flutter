import 'package:foodninja/core/network/api_error_handler.dart';
import 'package:foodninja/core/network/api_result.dart';
import 'package:foodninja/core/network/api_service.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/login/data/models/login_request_body.dart';
import 'package:foodninja/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);
  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      if (response.status == false) {
        return ApiResult.failure(
          ErrorHandler.handle("non",
              message: AppStrings.theEmailOrPasswordIsIncorrect),
        );
      } else {
        return ApiResult.success(response);
      }
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
