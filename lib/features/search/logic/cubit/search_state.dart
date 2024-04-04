part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchTypeChanged extends SearchState {}

class LoadingSearchData extends SearchState {}

class SearchFoodSuccessData extends SearchState {
    final AllFood foods;
  SearchFoodSuccessData(this.foods);
}



class SearchRestaurantSuccessData extends SearchState {
  final AllRestaurant restaurant;
  SearchRestaurantSuccessData(this.restaurant);
}

class SearchFallData extends SearchState {
  String  errorMassage;
  SearchFallData(
     this.errorMassage,
  );
}
