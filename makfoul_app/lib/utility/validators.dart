import 'package:easy_localization/easy_localization.dart';

class Validators {
  /// Validates verificationCode format

  static String? verificationCode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'codeReq'.tr();
    }
    // if (!RegExp(r'^\d{6}$').hasMatch(value)) {
    //   return 'The code must be 6 digits';
    // }
    return null;
  }

  /// Validates numberPhone format

  static String? numberPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'phoneReq'.tr();
    }
    if (value.length == 10) {
      return null;
    } else {
      return 'phoneValid'.tr();
    }
  }

  /// Validates email format
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'emailReq'.tr();
    }
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$',
    ).hasMatch(value)) {
      return 'emailFormat'.tr();
    }
    return null;
  }

  static String? username(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'nameReq'.tr();
    }
    if (value.length > 13) {
      return 'nameLess'.tr();
    }
    return null;
  }

  static String? validateCourseTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Required'.tr();
    }
    if (value.length > 15) {
      return 'courseUnder'.tr();
    }
    if (value.length < 5) {
      return 'courseAbove'.tr();
    }
    return null;
  }

  static String? validateTraineesNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Required'.tr();
    }
    if (int.parse(value) > 5) {
      return 'maxTrainee'.tr();
    }
    if (int.parse(value) < 1) {
      return 'atLest'.tr();
    }
    return null;
  }

  static String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Required'.tr();
    }
    if (int.parse(value) > 10000) {
      return 'maxPrice'.tr();
    }
    return null;
  }

  /// Validates password strength
  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'enterPass'.tr();
    }
    if (value.length < 8) {
      return 'passLeast'.tr();
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'passCap'.tr();
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'passSmall'.tr();
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'passDigit'.tr();
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'passSpe'.tr();
    }
    return null;
  }

  /// Validates confirm-password matches the original
  static String? confirmPassword(String? value, String pass1) {
    if (value == null || value.trim().isEmpty) {
      return 'passConf'.tr();
    }
    if (value != pass1) {
      return 'passMatch'.tr();
    }
    return null;
  }
}
