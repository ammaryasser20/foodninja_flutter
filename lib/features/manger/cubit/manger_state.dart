
part of 'manger_cubit.dart';


sealed class MangerState {}

final class MangerInitial extends MangerState {}
final class ChangeMode extends MangerState {}
final class ChangeLanguage extends MangerState {}

