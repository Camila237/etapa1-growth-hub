import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {

  final void Function()? onPressed;
  final String text;
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
