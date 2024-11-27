import 'package:etapa1/domain/validations/contract/validator.dart';

/// * Validator class that checks if a required field is not empty.
mixin RequiredFieldValidator on Validator {
  /// * Validates that the given [value] is not empty.
  /// * [value]: The value to be validated.
  /// * [message]: The error message to be returned if validation fails.
  /// * [messageRegex]: An optional error message to be returned if regex validation fails.
  /// * Returns a string containing the error message if validation fails, or null if validation succeeds.
  String? validateRequiredField({required String? value, required String message}) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }
}