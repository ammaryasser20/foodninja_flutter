import 'package:foodninja/main.dart';

const String imagePath = "assets/images";
const String jsonPath = "assets/json";

class ImageAssets {
  static const String logo = "$imagePath/Logo.svg";
  static const String pattern = "$imagePath/Pattern.svg";
  static String onboarding1 = isItDark()
      ? "$imagePath/onboarding1dark.svg"
      : "$imagePath/onboarding1.svg";
  static String onboarding2 = isItDark()
      ? "$imagePath/onboarding2dark.svg"
      : "$imagePath/onboarding2.svg";
  static const String email = "$imagePath/Message.svg";
  static const String googleIcon = "$imagePath/google-icon.svg";
  static const String facebookIcon = "$imagePath/facebook-icon.svg";
  static const String profile = "$imagePath/Profile.svg";
  static const String lock = "$imagePath/Lock.svg";
}

class JsonAssets {}