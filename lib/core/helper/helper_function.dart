import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/di/dependency_injection.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/features/search/logic/cubit/search_cubit.dart';
import 'package:foodninja/features/search/ui/search_view.dart';
import 'package:foodninja/main.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class HelperFunction {
  static Future<File?> setImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final value = await picker.pickImage(source: imageSource);

    if (value != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: File(value.path).path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Profile image',
            toolbarColor: ColorManager.primaryColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if (croppedFile != null) {
        final userImage = File(croppedFile.path);
        return userImage;
      }
    }

    return null;
  }

  static void pushName(String routeName) {
    Navigator.pushNamed(
        NavigationService.navigatorKey.currentContext!, routeName);
  }

  static void pushToSearch({String? searchFor, required BuildContext context}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => getIt<SearchCubit>(),
          child: SearchScreen(
            searchFor: searchFor,
          ),
        ),
      ),
    );
  }

  static void pushReplacementNamed(String routeName) {
    Navigator.pushReplacementNamed(
        NavigationService.navigatorKey.currentContext!, routeName);
  }

  static void pushNamedAndRemoveUntil(String routeName) {
    Navigator.pushNamedAndRemoveUntil(
        NavigationService.navigatorKey.currentContext!,
        routeName,
        (route) => false);
  }

 static String textSplit(String text) {
    String newText = '';
    for (int i = 0; text.length > i; i++) {
      if (i % 4 == 0) {
        newText = "$newText ${text[i]}";
      } else {
        newText = newText + text[i];
      }
    }
    return newText;
  }
}
