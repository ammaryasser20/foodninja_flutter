import 'package:foodninja/main.dart';

const String imagePath = "assets/images";
const String jsonPath = "assets/json";

class ImageAssets {
  static const String logo = "$imagePath/Logo.svg";
  static const String pattern = "$imagePath/Pattern.svg";
  static const String pattern2 = "$imagePath/Pattern2.svg";
  static String get onboarding1 => isItDark()
      ? "$imagePath/onboarding1dark.svg"
      : "$imagePath/onboarding1.svg";
  static String get onboarding2 => isItDark()
      ? "$imagePath/onboarding2dark.svg"
      : "$imagePath/onboarding2.svg";
  static const String email = "$imagePath/Message.svg";
  static const String googleIcon = "$imagePath/google-icon.svg";
  static const String facebookIcon = "$imagePath/facebook-icon.svg";
  static const String profile = "$imagePath/Profile.svg";
  static const String lock = "$imagePath/Lock.svg";
  static const String back = "$imagePath/Icon_back.svg";
  static const String paypal = "$imagePath/paypal.svg";
  static const String visa = "$imagePath/visa.svg";
  static const String payoneer = "$imagePath/Payoneer.svg";

  static const String camera = "$imagePath/camera.svg";
  static const String gallery = "$imagePath/gallery.svg";
  static const String closeIcon = "$imagePath/closeIcon.svg";
  static const String done = "$imagePath/done.svg";
  static const String home = "$imagePath/home.svg";
  static const String chat = "$imagePath/chat.svg";
  static const String buy = "$imagePath/buy.svg";
  static const String iconNotification = "$imagePath/Icon_notification.svg";
  static String get filterIcon =>
      isItDark() ? "$imagePath/FilterDark.svg" : "$imagePath/FilterLight.svg";

  static String get iconSearch => isItDark()
      ? "$imagePath/IconSearchDark.svg"
      : "$imagePath/IconSearchLight.svg";
  static String get backGround => isItDark()
      ? "$imagePath/backGroundDark.svg"
      : "$imagePath/backGroundLight.svg";
  static const String iceCream = "$imagePath/iceCream.png";
  static const String errorImage = "$imagePath/errorImage.png";
  static const String locationIcon = "$imagePath/locationIcon.svg";
  static const String loveIcon = "$imagePath/loveIcon.svg";
  static const String unLoveIcon = "$imagePath/unLoveIcon.svg";
  static const String iconMap = "$imagePath/iconMap.svg";
  static const String iconStar = "$imagePath/iconStar.svg";
  static const String shoppingBag = "$imagePath/shoppingBag.svg";
  static const String profileImage = "$imagePath/nonprofile.jpeg";
  static const String logout = "$imagePath/logout.svg";
  static const String searchNotFound = "$imagePath/searchNotFound.svg";
  static const String totalOrder = "$imagePath/totalOrder.svg";
  static const String cash = "$imagePath/Cash.png";
  static const String delivery = "$imagePath/delivery.png";
  static const String sendIcon = "$imagePath/sendIcon.svg";
}

class JsonAssets {}
