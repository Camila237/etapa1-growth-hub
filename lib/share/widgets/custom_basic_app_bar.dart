import 'package:flutter/material.dart';
import 'package:etapa1/config/themes/app_colors.dart';

class CustomBasicAppBar extends StatelessWidget {
  final IconData? icon;
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
