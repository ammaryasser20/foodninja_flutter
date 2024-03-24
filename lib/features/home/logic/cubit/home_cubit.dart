import 'package:connectivity_plus/connectivity_plus.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/local_DB/cached_app.dart';

import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/home/data/models/food.dart';
import 'package:foodninja/features/home/data/models/restaurant.dart';
import 'package:foodninja/features/home/data/repo/home_repo.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo, this.cachedApp) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  AllRestaurant? restaurants;
  CachedApp cachedApp;
  AllFood? foods;
  Future<void> getAllRestaurant(
      {required String token, bool activeLoading = true}) async {
    try {
      final response = cachedApp.getCachedData(CachedKeys.restaurantsData);
      restaurants = response;
      emit(SuccessData());
    } catch (error) {
      if (activeLoading) emit(LoadingData());
      if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
        final response = await homeRepo.getAllRestaurant(token);
        response.when(success: (restaurants) {
          cachedApp.saveData(restaurants, CachedKeys.restaurantsData);
          this.restaurants = restaurants;
          emit(SuccessData());
        }, failure: (error) {
          emit(ErrorData(errorMassage: error.apiErrorModel.message ?? 'error'));
        });
      } else {
        emit(ErrorData(errorMassage: AppStrings.noInternetConnection));
      }
    }
  }

  Future<void> getAllFood(
      {required String token, bool activeLoading = true}) async {
    try {
      final response = cachedApp.getCachedData(CachedKeys.foodData);
      foods = response;
      emit(SuccessData());
    } catch (error) {
      if (activeLoading) emit(LoadingData());
      if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
        final response = await homeRepo.getAllFood(token);
        response.when(success: (foods) {
          cachedApp.saveData(foods, CachedKeys.foodData);
          this.foods = foods;

          emit(SuccessData());
        }, failure: (error) {
          emit(ErrorData(errorMassage: error.apiErrorModel.message ?? 'error'));
        });
      } else {
        emit(ErrorData(errorMassage: AppStrings.noInternetConnection));
      }
    }
  }


}
