import 'package:dio/dio.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/network/api_service.dart';
import 'package:foodninja/core/network/dio_factory.dart';
import 'package:foodninja/features/home/data/repo/restaurant_repo.dart';
import 'package:foodninja/features/home/logic/cubit/home_cubit.dart';
import 'package:foodninja/features/login/data/repos/login_repo.dart';
import 'package:foodninja/features/login/logic/cubit/login_cubit.dart';
import 'package:foodninja/features/navigation_bar/logic/navigation_cubit.dart';

import 'package:foodninja/features/sign_up/data/repos/register_repo.dart';
import 'package:foodninja/features/sign_up/logic/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => (ApiService(dio)));
  getIt.registerFactory<LoginRepo>(() => (LoginRepo(getIt())));
  getIt.registerFactory<LoginCubit>(() => (LoginCubit(getIt())));
  getIt.registerFactory<RegisterRepo>(() => (RegisterRepo(getIt())));
  getIt.registerFactory<SignUpCubit>(() => (SignUpCubit(getIt())));
  getIt.registerFactory<CashHelper>(() => (CashHelper.init()));
  getIt.registerFactory<NavigationCubit>(() => (NavigationCubit()));
  getIt.registerFactory<RestaurantRepo>(() => (RestaurantRepo(getIt())));
  getIt.registerFactory<HomeCubit>(() => (HomeCubit(getIt())));
}
