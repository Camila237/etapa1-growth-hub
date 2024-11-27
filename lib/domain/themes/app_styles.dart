import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';

/// * [AppStyles] is a class that contains the styles used in the app.
class AppStyles {

  /// * [basicRoundedButton] is a method that returns a basic rounded button style, that can used in the app.
  static ButtonStyle basicRoundedButton({
    required Color colorBg,
    required Color colorText,
    double? radius,
    double? widthSide,
    Color? colorBorder,
    double? elevation,
  }) =>
      ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(colorBg),
        foregroundColor: WidgetStateProperty.all<Color>(colorText), // Text color
        padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: kSize20, vertical: kSize16)),
        elevation: WidgetStateProperty.all<double?>(elevation),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? kNone),
            side: BorderSide(
              color: colorBorder ?? kBlack,
              width: widthSide ?? kSize1,
            ),
          ),
        ),
      );
}
