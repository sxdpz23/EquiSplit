import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'colorConstants.dart';

abstract class HelperFunctions {
  static Widget createFAB({
    required String text,
    VoidCallback? action,
    IconData? icon,
    Color bgFAB = ColorConstants.pageFG,
    Color textFAB = ColorConstants.pageTXT}) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgFAB,
        ),
        onPressed: action ??
            () {
              if (kDebugMode) {
                print("FAB pressed :: $text");
              }
            },
        icon: icon == null
            ? null
            : Icon(
                icon,
                color: textFAB,
                size: 20.0,
              ),
        label: Text(
          text,
          style: TextStyle(color: textFAB),
        ),
      ),
    );
  }
}
