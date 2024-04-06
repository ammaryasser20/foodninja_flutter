import 'package:dio/dio.dart';
import 'package:foodninja/core/local_DB/cached_app.dart';
import 'package:foodninja/core/network/api_service.dart';
import 'package:foodninja/core/network/dio_factory.dart';
import 'package:foodninja/core/network/firebase.dart';
import 'package:foodninja/features/buy/logic/cubit/buy_cubit.dart';
import 'package:foodninja/features/chat/logic/cubit/chat_cubit.dart';
import 'package:foodninja/features/home/data/repo/home_repo.dart';
import 'package:foodninja/features/home/logic/cubit/home_cubit.dart';
import 'package:foodninja/features/login/data/repos/login_repo.dart';
import 'package:foodninja/features/login/logic/cubit/login_cubit.dart';
import 'package:foodninja/features/manger/cubit/manger_cubit.dart';
import 'package:foodninja/features/navigation_bar/logic/navigation_cubit.dart';
import 'package:foodninja/features/onboarding/logic/onboarding_cubit.dart';
import 'package:foodninja/features/profile/data/repo/repos.dart';
import 'package:foodninja/features/profile/logic/cubit/profile_cubit.dart';
import 'package:foodninja/features/search/data/repo/search_repo.dart';
import 'package:foodninja/features/search/logic/cubit/search_cubit.dart';

import 'package:foodninja/features/sign_up/data/repos/register_repo.dart';
import 'package:foodninja/features/sign_up/logic/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<MangerCubit>(() => MangerCubit());
  getIt.registerLazySingleton<ApiService>(() => (ApiService(dio)));
  getIt.registerLazySingleton<LoginRepo>(() => (LoginRepo(getIt())));
  getIt.registerLazySingleton<FireBaseServices>(() => (FireBaseServices()));
  getIt.registerFactory<OnboardingCubit>(() => (OnboardingCubit()));
  getIt.registerFactory<SearchRepo>(() => (SearchRepo(getIt())));
  getIt.registerFactory<SearchCubit>(() => (SearchCubit(getIt())));
  getIt.registerFactory<LoginCubit>(() => (LoginCubit(getIt(), getIt())));
  getIt.registerLazySingleton<RegisterRepo>(() => (RegisterRepo(getIt())));
  getIt.registerLazySingleton<SignUpCubit>(
      () => (SignUpCubit(getIt(), getIt())));
  getIt.registerLazySingleton<NavigationCubit>(() => (NavigationCubit()));
  getIt.registerLazySingleton<HomeRepo>(() => (HomeRepo(getIt(), getIt())));
  getIt.registerLazySingleton<CachedApp>(() => (CachedApp()));
  getIt.registerLazySingleton<ProfileRepo>(
      () => (ProfileRepo(getIt(), getIt())));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt(), getIt()));
  getIt.registerLazySingleton<BuyCubit>(() => BuyCubit());
    getIt.registerLazySingleton<ChatCubit>(() => ChatCubit());
  getIt.registerLazySingleton<ProfileCubit>(
      () => ProfileCubit(getIt(), getIt(), getIt()));
}

