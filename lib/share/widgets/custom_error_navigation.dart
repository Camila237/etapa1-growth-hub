import 'package:flutter/material.dart';

import '../../config/exports.dart';

class CustomErrorNavigation extends StatelessWidget {
  const CustomErrorNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'An error occurred, you have not selected a product.',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: kBlack,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: kSize10,
          ),
          ElevatedButton(
            style: AppStyles.basicRoundedButton(
              radius: kSize20,
              elevation: kSize2,
              colorBg: kTan,
              colorBorder: kTan,
              colorText: kWhite,
            ),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, kHomeScreen),
            child: Text(
              'Go Home',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: kWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
