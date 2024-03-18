import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/home/data/models/restaurant.dart';
import 'package:foodninja/features/home/data/repo/restaurant_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.restaurantRepo) : super(HomeInitial());
  final RestaurantRepo restaurantRepo;
  late AllRestaurant restaurants;
  Future<void> getAllRestaurant(String token) async {
    emit(LoadingData());

    if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
      final response = await restaurantRepo.getAllRestaurant(token);
      response.when(success: (restaurants) {
        this.restaurants = restaurants;
        emit(SuccessData(restaurants: restaurants));
      }, failure: (error) {
        emit(ErrorData(errorMassage: error.apiErrorModel.message ?? 'error'));
      });
    } else {
      emit(ErrorData(errorMassage: AppStrings.noInternetConnection));
    }
  }
}
