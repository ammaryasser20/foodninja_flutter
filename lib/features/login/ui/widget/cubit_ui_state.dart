import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/routes_manager.dart';
import 'package:foodninja/features/login/logic/cubit/login_cubit.dart';
import 'package:foodninja/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              ),
            );
          },
          success: (loginResponse) async {
            Navigator.pop(context);
            Map<String, dynamic> map;
          
            map = loginResponse.loginResponseToJson();
            String userInfo = jsonEncode(map["user"]);
            await CashHelper.putString(key: Keys.userInfo, value: userInfo);
            await CashHelper.putInt(
                key: Keys.userID, value: loginResponse.user.id);
            await CashHelper.putString(key: Keys.token, value: map["token"]);
              print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
            Navigator.pushReplacementNamed(context, AppRoute.navigationBar);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'OK',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
