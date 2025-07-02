import 'package:flutter/widgets.dart';

class Validators {
  /// Validates verificationCode format

  static String? verificationCode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter the verification code';
    }
    // if (!RegExp(r'^\d{6}$').hasMatch(value)) {
    //   return 'The code must be 6 digits';
    // }
    return null;
  }

  /// Validates numberPhone format

  static String? numberPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (value.length < 9) {
      return 'Phone number too short';
    }
    return null;
  }

  /// Validates email format
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$',
    ).hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  static String? username(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your UserName';
    }
    if (value.length > 13) {
      return 'Name must be less than 13 characters.';
    }
    return null;
  }

  static String? validateCourseTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter name for the course';
    }
    if (value.length > 15) {
      return 'the course must be under 15 letter.';
    }
     if (value.length > 5) {
      return 'the course must be above 5 letter.';
    }
    return null;
  }

static String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a Price for your';
    }
        if (int.parse(value) >= 5) {
      return 'The max Trainees is 5';
    }     if (int.parse(value) <1 ) {
      return 'at least put 1 trainee';
    }
    return null;
  }

static String? validateTraineesNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter Number of Trainees';
    }
  
    return null;
  }
  /// Validates password strength
  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'Password must contain at least one special character (!@#\$&*~)';
    }
    return null;
  }

  /// Validates confirm-password matches the original
  static String? confirmPassword(String? value, String pass1) {
    if (value == null || value.trim().isEmpty) {
      return 'Please confirm your password';
    }
    if (value != pass1) {
      return 'Passwords do not match';
    }
    return null;
  }
}
