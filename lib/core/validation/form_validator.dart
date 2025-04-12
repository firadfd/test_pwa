
import 'package:intl/intl.dart';

class FormValidation {
static String formatDate(String dateTimeString) {
  try {
    DateTime dateTime = DateTime.parse(dateTimeString).toLocal();
    String day = DateFormat('dd').format(dateTime);
    String month = DateFormat('MMM').format(dateTime);
    String time = DateFormat('hh:mm a').format(dateTime);

    return '$day $month • $time';
  } catch (e) {
    return 'Invalid Date';
  }
}
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email can't be empty";
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number cannot be empty';
    }

    // Phone number regex (accepts 10-15 digit numbers, with optional '+' at the beginning)
    const phonePattern = r'^\+?[0-9]{10,15}$';
    final regex = RegExp(phonePattern);

    if (!regex.hasMatch(value.trim())) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password can't be empty";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter";
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return "Password must contain at least one lowercase letter";
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number";
    }
    return null;
  }

  static  String? validatePin(String? value) {
    if (value == null || value.isEmpty) {
      return 'PIN cannot be empty';
    }
    if (value.length != 6) {
      return 'PIN must be exactly 6 digits';
    }
    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'PIN must contain only numbers';
    }
    return null;
  }

  static String? validateName(String? name) {
    if (name!.trim().isEmpty) {
      return "Name cannot be empty";
    }
    return null; // Indicates the name is valid
  }
  static String? validateAddress(String? name) {
    if (name!.trim().isEmpty) {
      return "Name cannot be empty";
    }
    return null; // Indicates the name is valid
  }
}