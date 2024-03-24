part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileLoadingImage extends ProfileState {}

class ProfileSuccessUploadingImage extends ProfileState {}

class ProfileSuccessDownloadingImage extends ProfileState {}
class ProfileAdded extends ProfileState {}
class ProfileSuccessGetAllInfo extends ProfileState {}
class FavoriteAdded extends ProfileState {}
class ProfileError extends ProfileState {
  ProfileError({required this.error});
  String error;
}
