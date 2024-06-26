// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Find your  Comfort\nFood here`
  String get onboardingTitleOne {
    return Intl.message(
      'Find your  Comfort\nFood here',
      name: 'onboardingTitleOne',
      desc: '',
      args: [],
    );
  }

  /// `Here You Can find a chef or dish for every\ntaste and color. Enjoy!`
  String get onboardingSubTitleOne {
    return Intl.message(
      'Here You Can find a chef or dish for every\ntaste and color. Enjoy!',
      name: 'onboardingSubTitleOne',
      desc: '',
      args: [],
    );
  }

  /// `Food Ninja is Where Your\nComfort Food Lives`
  String get onboardingTitleTwo {
    return Intl.message(
      'Food Ninja is Where Your\nComfort Food Lives',
      name: 'onboardingTitleTwo',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy a fast and smooth food delivery at\nyour doorstep`
  String get onboardingSubTitleTwo {
    return Intl.message(
      'Enjoy a fast and smooth food delivery at\nyour doorstep',
      name: 'onboardingSubTitleTwo',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Login To Your Account`
  String get loginScreenTitle {
    return Intl.message(
      'Login To Your Account',
      name: 'loginScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Or Continue With`
  String get orContinueWith {
    return Intl.message(
      'Or Continue With',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Your Password?`
  String get forgotYourPassword {
    return Intl.message(
      'Forgot Your Password?',
      name: 'forgotYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up For Free`
  String get signUpScreenTitle {
    return Intl.message(
      'Sign Up For Free',
      name: 'signUpScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `user name`
  String get userName {
    return Intl.message(
      'user name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Keep Me Signed In`
  String get keepMeSignedIn {
    return Intl.message(
      'Keep Me Signed In',
      name: 'keepMeSignedIn',
      desc: '',
      args: [],
    );
  }

  /// `Email Me About Special Pricing`
  String get emailMeAboutSpecialPricing {
    return Intl.message(
      'Email Me About Special Pricing',
      name: 'emailMeAboutSpecialPricing',
      desc: '',
      args: [],
    );
  }

  /// `already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `I don't Have account?`
  String get haveNotAccount {
    return Intl.message(
      'I don\'t Have account?',
      name: 'haveNotAccount',
      desc: '',
      args: [],
    );
  }

  /// `email and password invalid.`
  String get emailAndPasswordInvalid {
    return Intl.message(
      'email and password invalid.',
      name: 'emailAndPasswordInvalid',
      desc: '',
      args: [],
    );
  }

  /// `invalid email.`
  String get invalidEmail {
    return Intl.message(
      'invalid email.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `password must be at least 8 characters.`
  String get invalidPassword {
    return Intl.message(
      'password must be at least 8 characters.',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `The email or password is incorrect !`
  String get theEmailOrPasswordIsIncorrect {
    return Intl.message(
      'The email or password is incorrect !',
      name: 'theEmailOrPasswordIsIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `The email has already been taken.`
  String get theEmailHasAlreadyBeenTaken {
    return Intl.message(
      'The email has already been taken.',
      name: 'theEmailHasAlreadyBeenTaken',
      desc: '',
      args: [],
    );
  }

  /// `Name cant be empty`
  String get nameCantBeEmpty {
    return Intl.message(
      'Name cant be empty',
      name: 'nameCantBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `This data will be displayed in your account\nprofile for security`
  String get supTitleOfSignUpProcess {
    return Intl.message(
      'This data will be displayed in your account\nprofile for security',
      name: 'supTitleOfSignUpProcess',
      desc: '',
      args: [],
    );
  }

  /// `Upload Your Photo\nProfile`
  String get uploadYourPhotoProfile {
    return Intl.message(
      'Upload Your Photo\nProfile',
      name: 'uploadYourPhotoProfile',
      desc: '',
      args: [],
    );
  }

  /// `Congrats!`
  String get congrats {
    return Intl.message(
      'Congrats!',
      name: 'congrats',
      desc: '',
      args: [],
    );
  }

  /// `Your Profile Is Ready To Use`
  String get yourProfileIsReadyToUse {
    return Intl.message(
      'Your Profile Is Ready To Use',
      name: 'yourProfileIsReadyToUse',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buy {
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Find Your\nFavorite Food`
  String get homeScreenTitle {
    return Intl.message(
      'Find Your\nFavorite Food',
      name: 'homeScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to order?`
  String get hintSearchTextFormFile {
    return Intl.message(
      'What do you want to order?',
      name: 'hintSearchTextFormFile',
      desc: '',
      args: [],
    );
  }

  /// `Special Deal\nFor Today`
  String get specialDeal {
    return Intl.message(
      'Special Deal\nFor Today',
      name: 'specialDeal',
      desc: '',
      args: [],
    );
  }

  /// `Buy now`
  String get buyNow {
    return Intl.message(
      'Buy now',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `Restaurants`
  String get restaurant {
    return Intl.message(
      'Restaurants',
      name: 'restaurant',
      desc: '',
      args: [],
    );
  }

  /// `View More`
  String get viewMore {
    return Intl.message(
      'View More',
      name: 'viewMore',
      desc: '',
      args: [],
    );
  }

  /// `Popular Menus`
  String get popularMenus {
    return Intl.message(
      'Popular Menus',
      name: 'popularMenus',
      desc: '',
      args: [],
    );
  }

  /// `popular`
  String get popular {
    return Intl.message(
      'popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `Success adding image profile`
  String get successAddImage {
    return Intl.message(
      'Success adding image profile',
      name: 'successAddImage',
      desc: '',
      args: [],
    );
  }

  /// `Member Gold`
  String get memberGold {
    return Intl.message(
      'Member Gold',
      name: 'memberGold',
      desc: '',
      args: [],
    );
  }

  /// `please login again`
  String get pleaseLoginAgain {
    return Intl.message(
      'please login again',
      name: 'pleaseLoginAgain',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Wight Mode`
  String get wightMode {
    return Intl.message(
      'Wight Mode',
      name: 'wightMode',
      desc: '',
      args: [],
    );
  }

  /// `العربية`
  String get arabic {
    return Intl.message(
      'العربية',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `الانجليزية`
  String get english {
    return Intl.message(
      'الانجليزية',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred, please try again later`
  String get tryAgainLater {
    return Intl.message(
      'An error occurred, please try again later',
      name: 'tryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `Added to favorite!`
  String get addedToFavorite {
    return Intl.message(
      'Added to favorite!',
      name: 'addedToFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Removed from Favorite`
  String get removeFromFavorite {
    return Intl.message(
      'Removed from Favorite',
      name: 'removeFromFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Search not found`
  String get searchNotFound {
    return Intl.message(
      'Search not found',
      name: 'searchNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Type what you want to search for`
  String get typeWhatYouWantToSearchFor {
    return Intl.message(
      'Type what you want to search for',
      name: 'typeWhatYouWantToSearchFor',
      desc: '',
      args: [],
    );
  }

  /// `From Gallery`
  String get fromGallery {
    return Intl.message(
      'From Gallery',
      name: 'fromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get takePhoto {
    return Intl.message(
      'Take Photo',
      name: 'takePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Order details`
  String get orderDetails {
    return Intl.message(
      'Order details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Added To Chart`
  String get addedToChart {
    return Intl.message(
      'Added To Chart',
      name: 'addedToChart',
      desc: '',
      args: [],
    );
  }

  /// `Sub-Total`
  String get subTotal {
    return Intl.message(
      'Sub-Total',
      name: 'subTotal',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Charge`
  String get deliveryCharge {
    return Intl.message(
      'Delivery Charge',
      name: 'deliveryCharge',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Place My Order`
  String get placeMyOrder {
    return Intl.message(
      'Place My Order',
      name: 'placeMyOrder',
      desc: '',
      args: [],
    );
  }

  /// `No Order`
  String get noOrder {
    return Intl.message(
      'No Order',
      name: 'noOrder',
      desc: '',
      args: [],
    );
  }

  /// `Cant be Lower than 16 number`
  String get cantBeLowerThan16 {
    return Intl.message(
      'Cant be Lower than 16 number',
      name: 'cantBeLowerThan16',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Order`
  String get confirmOrder {
    return Intl.message(
      'Confirm Order',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get delivery {
    return Intl.message(
      'Delivery',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `No Messages`
  String get noMessages {
    return Intl.message(
      'No Messages',
      name: 'noMessages',
      desc: '',
      args: [],
    );
  }

  /// `Your order confirmed`
  String get yourOrderConfirmed {
    return Intl.message(
      'Your order confirmed',
      name: 'yourOrderConfirmed',
      desc: '',
      args: [],
    );
  }

  /// `Add Order`
  String get addOrder {
    return Intl.message(
      'Add Order',
      name: 'addOrder',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
