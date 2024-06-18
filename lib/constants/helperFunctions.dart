import 'package:equisplit/screens/qr/scannedDialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'constants.dart';
import 'colorConstants.dart';
import 'package:equisplit/models/qrCategories.dart';

abstract class HelperFunctions {
  static Widget createFAB(
      {required String text,
      VoidCallback? action,
      IconData? icon,
      Color bgFAB = ColorConstants.pageFG,
      Color textFAB = ColorConstants.pageFGTXT}) {
    return Padding(
      padding: const EdgeInsets.all(2.5),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgFAB,
        ),
        onPressed: action ??
            () {
              if (kDebugMode) {
                print("FAB Pressed :: $text");
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

  static Widget imageButton(
      {String imagePath = Constants.userImage,
      VoidCallback? action,
      double? border}) {
    const double imageRadius = 25.0;

    Widget image = CircleAvatar(
      radius: imageRadius,
      backgroundImage: NetworkImage(imagePath),
    );

    return GestureDetector(
      onTap: () => action ?? () => print("FAB Pressed :: Picture | HomePage"),
      child: border == null
          ? image
          : Container(
              height: imageRadius * 2 + border,
              width: imageRadius * 2 + border,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorConstants.pageTXT,
                  width: border,
                ),
                shape: BoxShape.circle,
              ),
              child: image,
            ),
    );
  }

  static Future triggerDialogAfterScanning(BuildContext context,
      {required String scannedValue, VoidCallback? restartAction}) {
    return showMaterialModalBottomSheet(
      elevation: 10.0,
      context: context,
      enableDrag: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      duration: Durations.medium2,
      builder: (context) {
        Size totalSize = MediaQuery.of(context).size;
        QrCategories qrCategory;
        if (scannedValue.startsWith("upi"))
          qrCategory = QrCategories.upi;
        else if (scannedValue.startsWith("friend"))
          qrCategory = QrCategories.friend;
        else if (scannedValue.startsWith("group"))
          qrCategory = QrCategories.group;
        else
          qrCategory = QrCategories.unknown;

        QrCategoriesData value = QrCategoriesData(
          category: qrCategory,
          scannedValue: scannedValue.substring(scannedValue.indexOf('?') + 1),
        );

        return Column(
          children: <Widget>[
            GestureDetector(
              onTap: restartAction != null
                  ? () {
                      Navigator.of(context).pop();
                      restartAction();
                    }
                  : () =>
                      Navigator.popUntil(context, ModalRoute.withName('/home')),
              child: Container(
                height: totalSize.height * 0.7 - 50.0,
                width: totalSize.width,
                color: Colors.transparent.withAlpha(0x66),
              ),
            ),
            ScannedDialog(qrCategoriesData: value),
          ],
        );
      },
    );
  }
}
