import 'package:flutter/material.dart';
import 'package:etapa1/domain/router/router_constants.dart';
import 'package:etapa1/domain/themes/app_colors.dart';
import 'package:etapa1/domain/themes/app_dimensions.dart';
import 'package:etapa1/domain/themes/app_styles.dart';

/// * Class that represents a custom error navigation.
class CustomErrorNavigation extends StatelessWidget {
  const CustomErrorNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    /// * Returns a centered column with a message and a button to navigate to the home screen.
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Lo sentimos ocurrió un error, no has seleccionado un producto.',
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
              'Ir a la vista principal',
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
