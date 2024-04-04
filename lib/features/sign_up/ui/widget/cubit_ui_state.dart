import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/helper/helper_function.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';

import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/network/routes_manager.dart';

import 'package:foodninja/features/sign_up/logic/signup_cubit.dart';
import 'package:foodninja/features/sign_up/logic/signup_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
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
          success: (registerResponse) async {
            Navigator.pop(context);

            await CashHelper.putInt(
                key: Keys.userID, value: registerResponse.data.id);

            HelperFunction.pushReplacementNamed(AppRoute.signUpProcess);
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
