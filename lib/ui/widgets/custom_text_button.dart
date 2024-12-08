import 'package:flutter/material.dart';

/// * Class that represents a custom text button.
class CustomTextButton extends StatelessWidget {
  /// * Function that will be executed when the button is pressed.
  final void Function()? onPressed;

  /// * Text that will be displayed in the button.
  final String text;

  /// * Color of the text.
  final Color colorText;
  const CustomTextButton({super.key, this.onPressed, required this.text, required this.colorText,});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: colorText,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
