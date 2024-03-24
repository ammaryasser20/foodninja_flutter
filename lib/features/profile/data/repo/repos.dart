import 'dart:async';

import 'package:foodninja/core/local_DB/cash_helper.dart';
import 'package:foodninja/core/network/api_service.dart';
import 'package:foodninja/core/network/firebase.dart';
import 'package:foodninja/features/home/data/models/food.dart';
import 'package:foodninja/features/home/data/models/restaurant.dart';

class ProfileRepo {
  final FireBaseServices fireBaseServices;
  ApiService apiService;
  ProfileRepo(
    this.fireBaseServices,
    this.apiService,
  );
  Future<List<dynamic>?> getUserFavorites(int userID) async {
    try {
      return await fireBaseServices.getFavorites(userID);
    } catch (e) {
      return null;
    }
  }

  Future<AllFood?> getOneFavorite(int favoriteID) async {
    try {
      final data = await apiService.getFoodByID(
          'Bearer ${CashHelper.getString(key: Keys.token)}', favoriteID);
      return data;
    } catch (e) {
      return null;
    }
  }  Future<AllRestaurant?> getOneRestaurant(String restaurantID) async {
    try {
      final data = await apiService.getRestaurantByID(
          'Bearer ${CashHelper.getString(key: Keys.token)}', restaurantID);
      return data;
    } catch (e) {
      return null;
    }
  }

  Future<bool> addUserFavorite(int userID, int foodID) async {
    try {
      await fireBaseServices.addFavorites(userID, foodID);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeFavorites(int userID, int foodID) async {
    try {
      await fireBaseServices.removeFavorites(userID, foodID);
      return true;
    } catch (e) {
      return false;
    }
  }
}
