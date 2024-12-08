import 'package:flutter/material.dart';
import 'package:etapa1/domain/themes/app_colors.dart';

/// * Class that represents a custom basic app bar that only contains a back button.
class CustomBasicAppBar extends StatelessWidget {

  /// * Icon that will be displayed in the back button.
  final IconData? icon;
  /// * Function that will be executed when the back button is pressed.
  final void Function()? onPressed;
  const CustomBasicAppBar({super.key, this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(icon ?? Icons.arrow_back_ios_new),
        color: kCrayola,
        onPressed: onPressed,
      ),
    );
  }
}
