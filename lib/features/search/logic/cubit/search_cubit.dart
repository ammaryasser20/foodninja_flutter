import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/resources/strings_manager.dart';

import 'package:foodninja/features/home/data/models/food.dart';
import 'package:foodninja/features/home/data/models/restaurant.dart';

import 'package:foodninja/features/search/data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  String searchType = AppStrings.menu;
  SearchRepo searchRepo;
  List<Restaurant> restaurants = [];
  static SearchCubit get(context) => BlocProvider.of(context);
  void typeOfSearch(String searchType) {
    this.searchType = searchType;
    emit(SearchTypeChanged());
  }

  Future<void> searchForFood(String name) async {
    emit(LoadingSearchData());
    final response = await searchRepo.searchForFood(
        name, CashHelper.getString(key: Keys.token));
    response.when(success: (foods) async {
      if (foods.food!.isNotEmpty) {
        for (Food food in foods.food!) {
          final restaurant =
              await searchRepo.getOneRestaurant(food.restaurantId!);
          restaurants.add(restaurant!.restaurant![0]);
        }
      }
      emit(SearchFoodSuccessData(foods));
    }, failure: (e) {
      emit(SearchFallData(e.apiErrorModel.message ?? 'error'));
    });
  }

  Future<void> searchForRestaurant(String name) async {
    emit(LoadingSearchData());
    final response = await searchRepo.searchRestaurant(
        name, CashHelper.getString(key: Keys.token));
    response.when(success: (restaurants) {
      emit(SearchRestaurantSuccessData(restaurants));
    }, failure: (e) {
      emit(SearchFallData(e.apiErrorModel.message ?? 'error'));
    });
  }
}
