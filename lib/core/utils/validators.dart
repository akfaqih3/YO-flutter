import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:yemen_offers/core/services/localizition/app_langs/keys.dart';

class AppRegex {
  // Matches a valid email address
  static final RegExp email = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

  // Matches a strong password (minimum 8 characters, includes at least one letter and one number)
  static final RegExp strongPassword = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  // Matches a valid phone number (example for 10-digit numbers)
  static final RegExp phoneNumber = RegExp(r'^(77|78|73|70|71)\d{7}$');

  // Matches a valid URL
  static final RegExp url = RegExp(
    r'^(https?:\/\/)?([\w\-])+\.{1}([a-zA-Z]{2,63})([\/\w\-\.]*)*\/?$',
  );

  // Matches a valid name (only letters, allows spaces and hyphens)
  static final RegExp name = RegExp(r'^[a-zA-Z\s\-]+$');
  static final RegExp name_ar = RegExp(
    r'^[a-zA-Z\s\-\u0600-\u06FF]+$',
  ); //add arabic letters

  // Matches only digits
  static final RegExp digits = RegExp(r'^\d+$');

  // Matches alphanumeric characters
  static final RegExp alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');

  // Matches a hex color code (e.g., #FFFFFF)
  static final RegExp hexColor = RegExp(r'^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$');

  static final RegExp latLong = RegExp(
    r'^(-?\d{1,3}(\.\d+)?),\s*(-?\d{1,3}(\.\d+)?)$',
  );

  static final RegExp address = RegExp(
    r'^([a-zA-Z\s\-\u0600-\u06FF]+),\s*([a-zA-Z\s\-\u0600-\u06FF]+),\s*([a-zA-Z\s\-\u0600-\u06FF]+),\s*([a-zA-Z\s\-\u0600-\u06FF]+)$',
  );

  // facebook link it should contain facebook.com

  static final RegExp facebookLink = RegExp(
    r'^(https?:\/\/)?([\w\-])+\.facebook\.com\/?$',
  );

  // instagram link it should contain instagram.com
  static final RegExp instagramLink = RegExp(
    r'^(https?:\/\/)?([\w\-])+\.instagram\.com\/?$',
  );

  // snapchat link it should contain snapchat.com
  static final RegExp snapchatLink = RegExp(
    r'^(https?:\/\/)?([\w\-])+\.snapchat\.com\/?$',
  );
}

//this is function for name validation
String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return msgNameRequired.tr;
  }
  if (value.length < 3) {
    return msgNameInvalid.tr;
  }
  if (!AppRegex.name_ar.hasMatch(value)) {
    return msgNameInvalid.tr;
  }

  return null;
}

//This is function for email validation
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return msgEmailRequired.tr;
  }
  if (!AppRegex.email.hasMatch(value)) {
    return msgEmailInvalid.tr;
  }
  return null;
}

// this is function for password validation
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return msgPasswordRequired.tr;
  }
  if (!AppRegex.strongPassword.hasMatch(value)) {
    return msgPasswordInvalid.tr;
  }
  return null;
}

//this is funciton for match password
String? validateMatchPassword(String? value, String? confirmPassword) {
  if (value == null || value.isEmpty) {
    return msgPasswordRequired.tr;
  }
  if (value != confirmPassword) {
    return msgPasswordsDoNotMatch.tr;
  }
  return null;
}

// this is function for phone number validation
String? validatephoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return msgPhoneRequired.tr;
  }
  if (!AppRegex.phoneNumber.hasMatch(value)) {
    return msgPhoneInvalid.tr;
  }
  return null;
}

//this is function for otp validation
String? validateOtp(String? value) {
  if (value == null || value.isEmpty) {
    return msgInvalidOtp.tr;
  }
  if (value.length != 6) {
    return msgInvalidOtp.tr;
  }

  if (!AppRegex.digits.hasMatch(value)) {
    return msgInvalidOtp.tr;
  }
  return null;
}

// this is function for url validation
String? validateUrl(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  if (!AppRegex.url.hasMatch(value)) {
    return msgUrlInvalid.tr;
  }
  return null;
}

// this is function for address validation
String? validateAddress(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  if (!AppRegex.address.hasMatch(value)) {
    return msgThisFieldIsRequired.tr;
  }
}

// this is function for lat long validation
String? validateLatLong(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  if (!AppRegex.latLong.hasMatch(value)) {
    return msgThisFieldIsRequired.tr;
  }
}

// this is function for facebook link validation
String? validateFacebookLink(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  if (!AppRegex.facebookLink.hasMatch(value)) {
    return msgUrlShouldContainFacebook.tr;
  }
}

// this is function for instagram link validation
String? validateInstagramLink(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  if (!AppRegex.instagramLink.hasMatch(value)) {
    return msgUrlShouldContainInstagram.tr;
  }
}

// this is function for snapchat link validation
String? validateSnapchatLink(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  if (!AppRegex.snapchatLink.hasMatch(value)) {
    return msgUrlShouldContainSnapchat.tr;
  }
}

String? validateStartDate(String? value) {
  if (value == null || value.isEmpty) {
    return msgThisFieldIsRequired.tr;
  }
  if (value.isEmpty) {
    return msgThisFieldIsRequired.tr;
  }
}

String? validateEndDate(String? value, startDateController) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال تاريخ الانتهاء';
  }

  final startText = startDateController.text;
  if (startText.isEmpty) return null;

  final startDate = DateTime.tryParse(startText);
  final endDate = DateTime.tryParse(value);

  if (startDate != null && endDate != null && endDate.isBefore(startDate)) {
    return 'تاريخ الانتهاء يجب أن يكون بعد تاريخ البدء';
  }

  return null;
}

String? validatePriceBefore(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال السعر قبل الخصم';
  }

  final price = double.tryParse(value);
  if (price == null) {
    return 'السعر غير صالح';
  }

  return null;
}

String? validatePriceAfter(String? value, priceBeforeController) {
  if (value == null || value.isEmpty) {
    return 'الرجاء إدخال السعر بعد الخصم';
  }
  final price = double.tryParse(value);
  if (price == null) {
    return 'السعر غير صالح';
  }
  final priceBefore = double.tryParse(priceBeforeController.text);
  if (priceBefore == null) {
    return 'السعر قبل الخصم غير صالح';
  }
  if (price > priceBefore) {
    return 'السعر بعد الخصم يجب ان يكون اصغر من السعر قبل الخصم';
  }
  return null;
}
