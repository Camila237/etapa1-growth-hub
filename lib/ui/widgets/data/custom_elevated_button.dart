import 'package:flutter/material.dart';
import 'package:etapa1/domain/themes/app_dimensions.dart';

/// * Class that represents a custom button that can be used it in all app.
class CustomElevatedButton extends StatelessWidget {
  /// * Function that will be executed when the button is pressed.
  final void Function()? onPressed;

  /// * Style of the button.
  final ButtonStyle? styleBtn;

  /// * Style of the text.
  final TextStyle? styleText;

  /// * Text that will be displayed in the button.
  final String text;

  /// * Icon that will be displayed in the button.
  final Icon? icon;
  const CustomElevatedButton({super.key, this.onPressed, this.styleBtn, this.styleText, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: styleBtn,
      child: Row(
        children: [
          if(icon != null)...[
            icon!,
            const SizedBox(width: kSize4),
          ],
          Text(
            text,
            style: styleText,
          ),
        ],
      ),
    );
  }
}
