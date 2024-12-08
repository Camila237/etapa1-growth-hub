import 'mixin/required_field_validator.dart';
import 'contract/validator.dart';

/// * Class that performs validation using a list of validators.
class Validations{
  /// * validate title [value] is the value to validate and [message] s the error message to return if validation fails.
  /// * Returns a string containing the error message if validation fails, or null if validation succeeds.
  static String? title({required String? value, required String message}) {
    return _TitleValidation().validate(value: value, message: message);
  }

  /// * validate description [value] is the value to validate and [message] s the error message to return if validation fails.
  /// * Returns a string containing the error message if validation fails, or null if validation succeeds.
  static String? description({required String? value, required String message}) {
    return _DescriptionValidation().validate(value: value, message: message);
  }

  /// * validate category [value] is the value to validate and [message] s the error message to return if validation fails.
  /// * Returns a string containing the error message if validation fails, or null if validation succeeds.
  static String? category({required String? value, required String message}) {
    return _CategoryValidation().validate(value: value, message: message);
  }
  /// * validate imageUrl [value] is the value to validate and [message] s the error message to return if validation fails.
  /// * Returns a string containing the error message if validation fails, or null if validation succeeds.
  static String? imageUrl({required String? value, required String message, required String messageRegex}) {
    return _ImageUrlValidation().validate(value: value, message: message, messageRegex: messageRegex);
  }
  /// * validate price [value] is the value to validate and [message] s the error message to return if validation fails.
  /// * Returns a string containing the error message if validation fails, or null if validation succeeds.
  static String? price({required String? value, required String message, required String messageRegex}) {
    return _PriceValidation().validate(value: value, message: message, messageRegex: messageRegex);
  }

  /// * validate rate [value] is the value to validate and [message] s the error message to return if validation fails.
  /// * Returns a string containing the error message if validation fails, or null if validation succeeds.
  static String? rate({required String? value, required String message, required String messageRegex}) {
    return _RateValidation().validate(value: value, message: message, messageRegex: messageRegex);
  }
}

/// * Private class for title validation.
class _TitleValidation extends Validator with RequiredFieldValidator {
  @override
  String? validate({required String? value, required String message, String? messageRegex}) {
    final RegExp titleRegExp = RegExp(r"^[A-Za-zÁÉÍÓÚáéíóúÑñÜü\s,.:0-9'% ]+$");
    
    String? msg = validateRequiredField(value: value, message: message);
    if (msg != null) {
      return msg;
    }

    if (!titleRegExp.hasMatch(value!)) {
      return message;
    }

    return null;
  }
}

/// * Private class for description validation.
class _DescriptionValidation extends Validator with RequiredFieldValidator {
  @override
  String? validate({required String? value, required String message, String? messageRegex}) {
    final RegExp descriptionRegExp = RegExp(r"^[A-Za-zÁÉÍÓÚáéíóúÑñÜü\s,.:0-9'%/()]+$");

    String? msg = validateRequiredField(value: value, message: message);
    if (msg != null) {
      return msg;
    }

    if (!descriptionRegExp.hasMatch(value!)) {
      return message;
    }

    return null;
  }
}

/// * Private class for category validation.
class _CategoryValidation extends Validator with RequiredFieldValidator {
  @override
  String? validate({required String? value, required String message, String? messageRegex}) {
    final RegExp categoryRegExp = RegExp(r"^[A-Za-zÁÉÍÓÚáéíóúÑñÜü\s,.:0-9']+$");

    String? msg = validateRequiredField(value: value, message: message);
    if (msg != null) {
      return msg;
    }

    if (!categoryRegExp.hasMatch(value!)) {
      return message;
    }

    return null;
  }
}

/// * Private class for imageUrl validation.
class _ImageUrlValidation extends Validator with RequiredFieldValidator {
  @override
  String? validate({required String? value, required String message, String? messageRegex}) {
    final RegExp imgRegExp = RegExp(r'^(https?:\/\/.*\.(?:png|jpg|jpeg|gif|bmp))$');

    String? msg = validateRequiredField(value: value, message: message);
    if (msg != null) {
      return msg;
    }

    if (!imgRegExp.hasMatch(value!)) {
      return messageRegex;
    }

    return null;
  }
}

/// * Private class for price validation.
class _PriceValidation extends Validator with RequiredFieldValidator {
  @override
  String? validate({required String? value, required String message, String? messageRegex}) {
    final RegExp numberRegExp = RegExp(r'^\d{1,}([.,]\d{1,2})?$');

    String? msg = validateRequiredField(value: value, message: message);
    if (msg != null) {
      return msg;
    }

    if (!numberRegExp.hasMatch(value!)) {
      return messageRegex;
    }

    return null;
  }
}

/// * Private class for rate validation.
class _RateValidation extends Validator with RequiredFieldValidator {
  @override
  String? validate({required String? value, required String message, String? messageRegex}) {
    final RegExp rateRegExp = RegExp(r'^[1-5](?:[.,]\d+)?$');

    String? msg = validateRequiredField(value: value, message: message);
    if (msg != null) {
      return msg;
    }

    if (!rateRegExp.hasMatch(value!)) {
      return messageRegex;
    }

    return null;
  }
}