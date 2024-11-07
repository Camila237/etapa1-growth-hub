import 'package:flutter/material.dart';

import 'package:etapa1/config/exports.dart';

class CustomDialogs{

  static Widget basic(BuildContext context, String? title, String message, List<Widget>? actions) => AlertDialog(
      backgroundColor: kWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Center(
        child: Text(
          title ?? '',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: kTan,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      content: Text(
        message,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: kBlack,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: actions,
    );
}