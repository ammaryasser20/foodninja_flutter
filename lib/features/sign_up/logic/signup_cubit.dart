import 'dart:io';
import 'package:foodninja/core/helper/helper_function.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/network/firebase.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/helper/regex.dart';
import 'package:foodninja/core/resources/routes_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/sign_up/data/models/register_request_body.dart';
import 'package:foodninja/features/sign_up/data/repos/register_repo.dart';

import 'package:foodninja/features/sign_up/logic/signup_state.dart';
import 'package:image_picker/image_picker.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final RegisterRepo _registerRepo;
  bool emailMeAboutSpecialPricing = true;
  File? userImage;
  SignUpCubit(this._registerRepo) : super(const SignUpState.initial());
  void register(RegisterRequestBody registerRequestBody) async {
    emit(const SignUpState.loading());
    if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
      if (isEmailAndPasswordValid(registerRequestBody)) {
        final response = await _registerRepo.register(registerRequestBody);
        response.when(success: (registerRequestBody) {
          emit(SignUpState.success(registerRequestBody));
        }, failure: (error) {
          emit(SignUpState.error(error: error.apiErrorModel.message ?? ''));
        });
      }
    } else {
      emit(SignUpState.error(error: AppStrings.noInternetConnection));
    }
  }

  changeEmailMe(bool state) {
    emailMeAboutSpecialPricing = state;
    emit(SignUpState.changeEmailMe(state));
  }

  nextPage(PageController controller) async {
    if (controller.page! < 1) {
      controller.nextPage(
          duration: const Duration(milliseconds: 700), curve: Curves.ease);
    } else {
      emit(const SignUpState.uploadingImage());
      if (userImage != null) {
        if (await Connectivity().checkConnectivity() !=
            ConnectivityResult.none) {
          final file = File(userImage!.path);
          if (await FireBaseServices.uploadImage(
              file: file, id: CashHelper.getInt(key: Keys.userID))) {
            emit(const SignUpState.successAddImage());
          } else {
            emit(SignUpState.errorUploadingImage(error: AppStrings.tryAgain));
          }
        } else {
          emit(SignUpState.errorUploadingImage(
              error: AppStrings.noInternetConnection));
        }
      }
    }
  }

  Future<void> setUserImage(ImageSource imageSource) async {
    userImage = await HelperFunction.setImage(imageSource);
    emit(const SignUpState.addImage());
  }

  deleteImage() {
    userImage = null;
    emit(const SignUpState.deleteImage());
  }

  bool isEmailAndPasswordValid(RegisterRequestBody registerRequestBody) {
    if (!AppRegex.isEmailValid(registerRequestBody.email) &&
        !AppRegex.hasMinLength(registerRequestBody.password) &&
        registerRequestBody.name.isEmpty) {
      emit(
        SignUpState.error(error: AppStrings.emailAndPasswordInvalid),
      );
      return false;
    } else if (!AppRegex.isEmailValid(registerRequestBody.email)) {
      emit(
        SignUpState.error(error: AppStrings.invalidEmail),
      );
      return false;
    } else if (!AppRegex.hasMinLength(registerRequestBody.password)) {
      emit(
        SignUpState.error(error: AppStrings.invalidPassword),
      );
      return false;
    } else if (registerRequestBody.name.isEmpty) {
      emit(
        SignUpState.error(error: AppStrings.nameCantBeEmpty),
      );
      return false;
    }
    return true;
  }

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoute.login);
  }
}
