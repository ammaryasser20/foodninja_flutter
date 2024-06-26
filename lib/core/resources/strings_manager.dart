import 'package:foodninja/generated/l10n.dart';
import 'package:foodninja/main.dart';

class AppStrings {
  static const foodNinja = 'FoodNinja';
  static const delieverFavoriteFood = 'Deliever Favorite Food';

  static String get onboardingTitleOne =>
      S.of(NavigationService.navigatorKey.currentContext!).onboardingTitleOne;
  static String get onboardingSubTitleOne => S
      .of(NavigationService.navigatorKey.currentContext!)
      .onboardingSubTitleOne;
  static String get onboardingTitleTwo =>
      S.of(NavigationService.navigatorKey.currentContext!).onboardingTitleTwo;
  static String get onboardingSubTitleTwo => S
      .of(NavigationService.navigatorKey.currentContext!)
      .onboardingSubTitleTwo;
  static String get next =>
      S.of(NavigationService.navigatorKey.currentContext!).next;
  static String get loginScreenTitle =>
      S.of(NavigationService.navigatorKey.currentContext!).loginScreenTitle;
  static String get email =>
      S.of(NavigationService.navigatorKey.currentContext!).email;
  static String get password =>
      S.of(NavigationService.navigatorKey.currentContext!).password;
  static String get orContinueWith =>
      S.of(NavigationService.navigatorKey.currentContext!).orContinueWith;
  static String faceBook = 'Facebook';
  static String google = 'Google';
  static String get forgotYourPassword =>
      S.of(NavigationService.navigatorKey.currentContext!).forgotYourPassword;
  static String get login =>
      S.of(NavigationService.navigatorKey.currentContext!).login;
  static String get signUpScreenTitle =>
      S.of(NavigationService.navigatorKey.currentContext!).signUpScreenTitle;
  static String get userName =>
      S.of(NavigationService.navigatorKey.currentContext!).userName;
  static String get createAccount =>
      S.of(NavigationService.navigatorKey.currentContext!).createAccount;
  static String get keepMeSignedIn =>
      S.of(NavigationService.navigatorKey.currentContext!).keepMeSignedIn;
  static String get emailMeAboutSpecialPricing => S
      .of(NavigationService.navigatorKey.currentContext!)
      .emailMeAboutSpecialPricing;
  static String get alreadyHaveAnAccount =>
      S.of(NavigationService.navigatorKey.currentContext!).alreadyHaveAnAccount;

  static String get haveNotAccount =>
      S.of(NavigationService.navigatorKey.currentContext!).haveNotAccount;
  static String get emailAndPasswordInvalid => S
      .of(NavigationService.navigatorKey.currentContext!)
      .emailAndPasswordInvalid;
  static String get invalidEmail =>
      S.of(NavigationService.navigatorKey.currentContext!).invalidEmail;
  static String get invalidPassword =>
      S.of(NavigationService.navigatorKey.currentContext!).invalidPassword;
  static String get theEmailOrPasswordIsIncorrect => S
      .of(NavigationService.navigatorKey.currentContext!)
      .theEmailOrPasswordIsIncorrect;
  static String get theEmailHasAlreadyBeenTaken => S
      .of(NavigationService.navigatorKey.currentContext!)
      .theEmailHasAlreadyBeenTaken;
  static String get nameCantBeEmpty =>
      S.of(NavigationService.navigatorKey.currentContext!).nameCantBeEmpty;
  static String get noInternetConnection =>
      S.of(NavigationService.navigatorKey.currentContext!).noInternetConnection;

  static String get paymentMethod =>
      S.of(NavigationService.navigatorKey.currentContext!).paymentMethod;
  static String get supTitleOfSignUpProcess => S
      .of(NavigationService.navigatorKey.currentContext!)
      .supTitleOfSignUpProcess;
  static String get uploadYourPhotoProfile => S
      .of(NavigationService.navigatorKey.currentContext!)
      .uploadYourPhotoProfile;
  static String get congrats =>
      S.of(NavigationService.navigatorKey.currentContext!).congrats;
  static String get yourProfileIsReadyToUse => S
      .of(NavigationService.navigatorKey.currentContext!)
      .yourProfileIsReadyToUse;
  static String get tryAgain =>
      S.of(NavigationService.navigatorKey.currentContext!).tryAgain;
  static String get home =>
      S.of(NavigationService.navigatorKey.currentContext!).home;
  static String get profile =>
      S.of(NavigationService.navigatorKey.currentContext!).profile;
  static String get buy =>
      S.of(NavigationService.navigatorKey.currentContext!).buy;
  static String get chat =>
      S.of(NavigationService.navigatorKey.currentContext!).chat;
  static String get homeScreenTitle =>
      S.of(NavigationService.navigatorKey.currentContext!).homeScreenTitle;
  static String get hintSearchTextFormFile => S
      .of(NavigationService.navigatorKey.currentContext!)
      .hintSearchTextFormFile;
  static String get specialDeal =>
      S.of(NavigationService.navigatorKey.currentContext!).specialDeal;
  static String get buyNow =>
      S.of(NavigationService.navigatorKey.currentContext!).buyNow;
  static String get restaurant =>
      S.of(NavigationService.navigatorKey.currentContext!).restaurant;
  static String get viewMore =>
      S.of(NavigationService.navigatorKey.currentContext!).viewMore;
  static String get popularMenu =>
      S.of(NavigationService.navigatorKey.currentContext!).popularMenus;
  static String get popular =>
      S.of(NavigationService.navigatorKey.currentContext!).popular;
  static String get successAddImage =>
      S.of(NavigationService.navigatorKey.currentContext!).successAddImage;
  static String get memberGold =>
      S.of(NavigationService.navigatorKey.currentContext!).memberGold;
  static String get pleaseLoginAgain =>
      S.of(NavigationService.navigatorKey.currentContext!).pleaseLoginAgain;
  static String get favorites =>
      S.of(NavigationService.navigatorKey.currentContext!).favorites;
  static String get darkMode =>
      S.of(NavigationService.navigatorKey.currentContext!).darkMode;
  static String get wightMode =>
      S.of(NavigationService.navigatorKey.currentContext!).wightMode;
  static String get english =>
      S.of(NavigationService.navigatorKey.currentContext!).english;
  static String get arabic =>
      S.of(NavigationService.navigatorKey.currentContext!).arabic;
  static String get tryAgainLater =>
      S.of(NavigationService.navigatorKey.currentContext!).tryAgainLater;
  static String get addedToFavorite =>
      S.of(NavigationService.navigatorKey.currentContext!).addedToFavorite;
  static String get removeFromFavorite =>
      S.of(NavigationService.navigatorKey.currentContext!).removeFromFavorite;
  static String get type =>
      S.of(NavigationService.navigatorKey.currentContext!).type;
  static String get menu =>
      S.of(NavigationService.navigatorKey.currentContext!).menu;
  static String get search =>
      S.of(NavigationService.navigatorKey.currentContext!).search;
  static String get searchNotFound =>
      S.of(NavigationService.navigatorKey.currentContext!).searchNotFound;
  static String get typeWhatYouWantToSearchFor => S
      .of(NavigationService.navigatorKey.currentContext!)
      .typeWhatYouWantToSearchFor;
  static String get fromGallery =>
      S.of(NavigationService.navigatorKey.currentContext!).fromGallery;
  static String get takePhoto =>
      S.of(NavigationService.navigatorKey.currentContext!).takePhoto;
  static String get orderDetails =>
      S.of(NavigationService.navigatorKey.currentContext!).orderDetails;
  static String get addedToChart =>
      S.of(NavigationService.navigatorKey.currentContext!).addedToChart;
  static String get subTotal =>
      S.of(NavigationService.navigatorKey.currentContext!).subTotal;
  static String get deliveryCharge =>
      S.of(NavigationService.navigatorKey.currentContext!).deliveryCharge;
  static String get total =>
      S.of(NavigationService.navigatorKey.currentContext!).total;
  static String get placeMyOrder =>
      S.of(NavigationService.navigatorKey.currentContext!).placeMyOrder;
  static String get noOrder =>
      S.of(NavigationService.navigatorKey.currentContext!).noOrder;
  static String get cantBeLowerThan16 =>
      S.of(NavigationService.navigatorKey.currentContext!).cantBeLowerThan16;
  static String get confirmOrder =>
      S.of(NavigationService.navigatorKey.currentContext!).confirmOrder;
  static String get edit =>
      S.of(NavigationService.navigatorKey.currentContext!).edit;
  static String get delivery =>
      S.of(NavigationService.navigatorKey.currentContext!).delivery;
  static String get noMessages =>
      S.of(NavigationService.navigatorKey.currentContext!).noMessages;
  static String get yourOrderConfirmed =>
      S.of(NavigationService.navigatorKey.currentContext!).yourOrderConfirmed;
      static String get addOrder =>
      S.of(NavigationService.navigatorKey.currentContext!).addOrder;
}
