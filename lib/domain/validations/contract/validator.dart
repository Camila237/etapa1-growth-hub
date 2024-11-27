/// * Abstract class that defines a contract for validators.
abstract class Validator {
  /// * Validates the given [value] and returns an error message if validation fails.
  /// * [value]: The value to be validated.
  /// * [message]: The error message to be returned if validation fails.
  /// * [messageRegex]: An optional error message to be returned if regex validation fails.
  /// * Returns a string containing the error message if validation fails, or null if validation succeeds.
  String? validate({required String? value, required String message, String? messageRegex});
}