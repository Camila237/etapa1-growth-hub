import 'package:flutter/material.dart';

import '../../config/exports.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final ButtonStyle? styleBtn;
  final TextStyle? styleText;
  final String text;
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
