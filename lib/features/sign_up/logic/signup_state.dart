import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';


@freezed
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading() = Loading;
  const factory SignUpState.success(T data) = Success<T>;
  const factory SignUpState.error({required String error}) = Error;
  const factory SignUpState.changeEmailMe(bool data) = ChangeEmailMe<T>;
  const factory SignUpState.addImage() = addImage;
  const factory SignUpState.deleteImage() = deleteImage;
   const factory SignUpState.uploadingImage() = UploadingImage;
  
   const factory SignUpState.successAddImage() = SuccessAddImage;
     const factory SignUpState.errorUploadingImage({required String error}) = ErrorUploadingImage;
}

