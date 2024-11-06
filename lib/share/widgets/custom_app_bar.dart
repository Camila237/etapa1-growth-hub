import 'package:flutter/material.dart';

import '../../config/exports.dart';

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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
