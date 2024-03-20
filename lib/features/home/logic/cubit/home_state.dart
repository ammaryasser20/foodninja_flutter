part of 'home_cubit.dart';

//
abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadingData extends HomeState {}

final class SuccessData extends HomeState {

}

final class ErrorData extends HomeState {
  final String errorMassage;

  ErrorData({required this.errorMassage});
}
