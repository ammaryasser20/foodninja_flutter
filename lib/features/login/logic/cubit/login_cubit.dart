import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:foodninja/core/helper/regex.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/network/firebase.dart';
import 'package:foodninja/core/network/routes_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';

import 'package:foodninja/features/login/data/models/login_request_body.dart';
import 'package:foodninja/features/login/data/models/login_response.dart';

import 'package:foodninja/features/login/data/repos/login_repo.dart';

import 'package:foodninja/features/login/logic/cubit/login_state.dart';
import 'package:foodninja/main.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo,this.fireBaseServices) : super(const LoginState.initial());
  final LoginRepo _loginRepo;
  LoginResponse? loginResponse;
  FireBaseServices fireBaseServices;
  void login(LoginRequestBody loginRequestBody) async {
    bool isAllOk = false;

    emit(const LoginState.loading());
    if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
      if (isEmailAndPasswordValid(loginRequestBody)) {
        final response = await _loginRepo.login(loginRequestBody);
        response.when(success: (loginResponse) {
          this.loginResponse = loginResponse;
          emit(LoginState.success(loginResponse));
          isAllOk = true;
        }, failure: (error) {
          emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
        });
      }
      if (isAllOk) {
        Map<String, dynamic> map;
        map = loginResponse!.loginResponseToJson();
        String userInfo = jsonEncode(map["user"]);
        await CashHelper.putString(key: Keys.userInfo, value: userInfo);

        await CashHelper.putInt(
            key: Keys.userID, value: loginResponse!.user!.id!);
        await CashHelper.putString(key: Keys.token, value: map["token"]);
        emit(const LoginState.loading());
        final userImageString = await fireBaseServices.downloadImage(
          id: CashHelper.getInt(key: Keys.userID),
        );
        if (userImageString != null) {
          CashHelper.putString(key: Keys.userImage, value: userImageString);
        }

        LoginState.success(loginResponse);
        Navigator.pushNamedAndRemoveUntil(
            NavigationService.navigatorKey.currentContext!,
            AppRoute.navigationBar,(route)=> false);
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
