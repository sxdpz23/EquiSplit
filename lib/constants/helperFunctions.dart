import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'colorConstants.dart';

abstract class HelperFunctions {

  static Widget createFAB({required String text, VoidCallback? action, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.pageFG,
        ),
        onPressed: action ?? () {
          if (kDebugMode) {
            print("FAB pressed :: $text");
          }
        },
        icon: icon==null ? null : Icon(
            icon,
          color: ColorConstants.pageTXT,
          size: 20.0,
        ),
        label: Text(
          text,
          style: const TextStyle(color: ColorConstants.pageTXT),
        ),
      ),
    );
  }

}