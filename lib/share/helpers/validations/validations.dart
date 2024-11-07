import 'mixin/required_field_validator.dart';
import 'contract/validator.dart';

class Validations{
  static String? title({required String? value, required String message}) {
    return _TitleValidation().validate(value: value, message: message);
  }
  static String? description({required String? value, required String message}) {
    return _DescriptionValidation().validate(value: value, message: message);
  }
  static String? category({required String? value, required String message}) {
    return _CategoryValidation().validate(value: value, message: message);
  }
  static String? imageUrl({required String? value, required String message, required String messageRegex}) {
    return _ImageUrlValidation().validate(value: value, message: message, messageRegex: messageRegex);
  }
  static String? number({required String? value, required String message, required String messageRegex}) {
    return _NumberValidation().validate(value: value, message: message, messageRegex: messageRegex);
  }
}

class _TitleValidation extends Validator with RequiredFieldValidator {
  @override
  String? validate({required String? value, required String message, String? messageRegex}) {
    final RegExp nameRegExp = RegExp(r"^[A-Za-zÁÉÍÓÚáéíóúÑñÜü]+$");

    String? msg = validateRequiredField(value: value, message: message);
    if (msg != null) {
      return msg;
    }

    if (!nameRegExp.hasMatch(value!)) {
      return message;
    }

    return null;
  }
}
class _DescriptionValidation extends Validator with RequiredFieldValidator {
  @override
  String? validate({required String? value, required String message, String? messageRegex}) {
    final RegExp nameRegExp = RegExp(r"^[A-Za-zÁÉÍÓÚáéíóúÑñÜü]+$");

    String? msg = validateRequiredField(value: value, message: message);
    if (msg != null) {
      return msg;
    }

    if (!nameRegExp.hasMatch(value!)) {
      return message;
    }

    return null;
  }
}
class _CategoryValidation extends Validator with RequiredFieldValidator {
  @override
  String? validate({required String? value, required String message, String? messageRegex}) {
    final RegExp nameRegExp = RegExp(r"^[A-Za-zÁÉÍÓÚáéíóúÑñÜü]+$");

    String? msg = validateRequiredField(value: value, message: message);
    if (msg != null) {
      return msg;
    }

    if (!nameRegExp.hasMatch(value!)) {
      return message;
    }

    return null;
  }
}

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

class _NumberValidation extends Validator with RequiredFieldValidator {
  @override
  String? validate({required String? value, required String message, String? messageRegex}) {
    final RegExp numberRegExp = RegExp(r'^\d{1,3}([.,]\d{1,2})?$');

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