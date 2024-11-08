import 'package:etapa1/config/exports.dart';
import 'package:flutter/material.dart';

class AppStyles {
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
