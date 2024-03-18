// import 'package:freezed_annotation/freezed_annotation.dart';
//  part 'manger_state.freezed.dart';

// @freezed
// class MangerState with MangerState {
//   const factory MangerState.initial() = _Initial;
//   const factory MangerState.changeLanguage() = ChangeLanguage;
//   const factory MangerState.changeMode() = ChangeMode;
// }
part of 'manger_cubit.dart';


sealed class MangerState {}

final class MangerInitial extends MangerState {}
final class ChangeMode extends MangerState {}
final class ChangeLanguage extends MangerState {}

