import 'package:flutter/material.dart';
import 'package:etapa1/domain/constants/app_constants.dart';
import 'package:etapa1/domain/themes/app_colors.dart';
import 'package:etapa1/domain/themes/app_dimensions.dart';

/// * Class that represents a custom app bar.
/// * This class extends [StatelessWidget] and implements [PreferredSizeWidget] to provide an AppBar with a specific layout.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kCrayola,
      title: const Row(
        children: [
          Icon(Icons.shopping_bag_outlined, color: kWhite, size: kSize24),
          SizedBox(width: kSize10,),
          Text(kNameApp, style: TextStyle(fontSize: kSize24, fontWeight: FontWeight.w300, color: kWhite03),),
        ],
      ),
    );
  }

  @override
  /// * Returns the preferred size of the app bar.
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
