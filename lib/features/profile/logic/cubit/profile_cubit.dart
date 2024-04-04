import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodninja/core/helper/helper_function.dart';
import 'package:foodninja/core/local_DB/cached_app.dart';
import 'package:foodninja/core/local_DB/cash_helper.dart';

import 'package:foodninja/core/network/firebase.dart';

import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/home/data/models/food.dart';
import 'package:foodninja/features/home/data/models/restaurant.dart';
import 'package:foodninja/features/login/data/models/login_response.dart';
import 'package:foodninja/features/profile/data/repo/repos.dart';
import 'package:foodninja/features/widget/image_selection.dart';
import 'package:foodninja/main.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileRepo profileRepo;
  List<dynamic>? favoriteIDs;
  Map<String, Restaurant?> favoriteRestaurantWithIDs = {};
  List<Food> favoriteFoods = [];
  CachedApp cachedApp;
  ProfileCubit(this.fireBaseServices, this.profileRepo, this.cachedApp)
      : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  User? user;
  File? userImageFile;
  String userImageString = '';
  FireBaseServices fireBaseServices;
  Future<void> showImagePickerOption(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ImageSelection(functionCamera: () async {
          await setUserImage(ImageSource.camera);
        }, functionGallery: () async {
          await setUserImage(ImageSource.gallery);
        });
      },
    );
  }

  Future<void> setUserImage(ImageSource imageSource) async {
    userImageFile = await HelperFunction.setImage(imageSource);
    if (userImageFile != null) {
      if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
        emit(ProfileLoading());
        final file = File(userImageFile!.path);
        if (await fireBaseServices.uploadImage(
          file: file,
          id: CashHelper.getInt(
            key: Keys.userID,
          ),
        )) {
          userImageString = await fireBaseServices.downloadImage(
                id: CashHelper.getInt(key: Keys.userID),
              ) ??
              '';
          if (userImageString != '') {
            CashHelper.putString(key: Keys.userImage, value: userImageString);
          }
          emit(ProfileSuccessGetAllInfo());
          ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
              .showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 500),
            content: Text(AppStrings.successAddImage),
          ));
        } else {
          ProfileError(error: AppStrings.tryAgain);
        }
      } else {
        emit(
          ProfileError(error: AppStrings.noInternetConnection),
        );
      }
    }
  }

  Future<void> getUserInfo() async {
    favoriteFoods = [];
    emit(ProfileLoading());
    userImageString = CashHelper.getString(key: Keys.userImage);
    final info = CashHelper.getString(key: Keys.userInfo);
    if (info != '') {
      user = User.fromString(info);
      try {
        favoriteFoods = cachedApp.getCachedData(CachedKeys.favoriteData);
      } catch (e) {
        favoriteIDs = await profileRepo.getUserFavorites(user!.id ?? 0);
        if (favoriteIDs != null) {
          for (int favoriteID in favoriteIDs!) {
            final data = await profileRepo.getOneFavorite(favoriteID);
            if (data != null && data.food!.isNotEmpty) {
              favoriteFoods.add(data.food![0]);
              final response = await profileRepo
                  .getOneRestaurant(data.food![0].restaurantId!);
              if (response != null && response.restaurant!.isNotEmpty) {
                favoriteRestaurantWithIDs[data.food![0].restaurantId!] =
                    response.restaurant![0];
              } else {
                favoriteRestaurantWithIDs[data.food![0].restaurantId!] = null;
              }
            }
          }
          cachedApp.saveData(favoriteFoods, CachedKeys.favoriteData);
        }
      }

      emit(ProfileSuccessGetAllInfo());
    } else {
      ProfileError(error: AppStrings.pleaseLoginAgain);
    }
  }

  Future<void> addFavorite(Food food) async {
    if (await profileRepo.addUserFavorite(
        CashHelper.getInt(key: Keys.userID), food.id!)) {
      ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
          .showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 500),
          backgroundColor: ColorManager.primaryColor,
          content: Text(AppStrings.addedToFavorite),
        ),
      );
      favoriteFoods.add(food);
      cachedApp.removeFromCache(CachedKeys.favoriteData);
      emit(FavoriteAdded());
    } else {
      ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
          .showSnackBar(
        SnackBar(
          backgroundColor: ColorManager.orange,
          content: Text(AppStrings.typeWhatYouWantToSearchFor),
        ),
      );
    }
  }

  Future<void> removeFavorites(Food food) async {
    if (await profileRepo.removeFavorites(
        CashHelper.getInt(key: Keys.userID), food.id!)) {
      ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
          .showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 500),
          backgroundColor: ColorManager.primaryColor,
          content: Text(AppStrings.removeFromFavorite),
        ),
      );

      favoriteFoods.removeWhere((element) => element.id == food.id);
      cachedApp.removeFromCache(CachedKeys.favoriteData);
      emit(FavoriteAdded());
    } else {
      ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
          .showSnackBar(
        SnackBar(
          backgroundColor: ColorManager.orange,
          content: Text(AppStrings.tryAgainLater),
        ),
      );
    }
  }
}
