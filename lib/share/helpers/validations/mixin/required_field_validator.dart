import 'package:etapa1/share/helpers/validations/contract/validator.dart';

mixin RequiredFieldValidator on Validator {
  String? validateRequiredField({required String? value, required String message}) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }
}