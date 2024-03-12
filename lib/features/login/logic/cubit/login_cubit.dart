import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:foodninja/core/helper/regex.dart';
import 'package:foodninja/core/resources/routes_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';

import 'package:foodninja/features/login/data/models/login_request_body.dart';

import 'package:foodninja/features/login/data/repos/login_repo.dart';

import 'package:foodninja/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  void login(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
      if (isEmailAndPasswordValid(loginRequestBody)) {
        final response = await _loginRepo.login(loginRequestBody);
        response.when(success: (loginResponse) {
          emit(LoginState.success(loginResponse));
        }, failure: (error) {
          emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
        });
      }
    } else {
      emit(LoginState.error(error: AppStrings.noInternetConnection));
    }
  }

  bool isEmailAndPasswordValid(LoginRequestBody loginRequestBody) {
    if (!AppRegex.isEmailValid(loginRequestBody.email) &&
        !AppRegex.hasMinLength(loginRequestBody.password)) {
      emit(
        LoginState.error(error: AppStrings.emailAndPasswordInvalid),
      );
      return false;
    } else if (!AppRegex.isEmailValid(loginRequestBody.email)) {
      emit(
        LoginState.error(error: AppStrings.invalidEmail),
      );
      return false;
    } else if (!AppRegex.hasMinLength(loginRequestBody.password)) {
      emit(
        LoginState.error(error: AppStrings.invalidPassword),
      );
      return false;
    }
    return true;
  }

  void navigateToSignUpScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoute.signUp);
  }
}
