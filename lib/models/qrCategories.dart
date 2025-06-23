import 'package:equisplit/constants/colorConstants.dart';
import 'package:equisplit/constants/constants.dart';
import 'package:equisplit/models/groupCategories.dart';
import 'package:flutter/material.dart';

enum QrCategories { friend, group, upi, unknown }

class QrCategoriesData {
  QrCategoriesData({required this.category, required this.scannedValue});

  final QrCategories category;
  final String scannedValue;

  Color cardColor() {
    switch (category) {
      case QrCategories.friend:
        return ColorConstants.qcFriend;
      case QrCategories.group:
        return ColorConstants.qcGroup;
      case QrCategories.upi:
        return ColorConstants.qcPayments;
      default:
        return ColorConstants.qcUnknown;
    }
  }

  String? _getValueFromKey(String key) {
    String? endValue;
    scannedValue.split('&').forEach((value) {
      if (value.contains(key))
        endValue = value.substring(key.length).replaceAll("%20", ' ');
    });
    return endValue;
  }

  String? name() {
    if (category == QrCategories.unknown) return null;

    final String nameKey = category == QrCategories.upi ? "pn=" : "name=";
    return _getValueFromKey(nameKey);
  }

  double? amount() {
    if (category != QrCategories.upi) return null;

    const String amountKey = "am=";
    String? amount = _getValueFromKey(amountKey);
    return amount != null ? double.parse(amount) : null;
  }

  String? upiID() {
    if (category != QrCategories.upi) return null;

    const String upiKey = "pa=";
    return _getValueFromKey(upiKey);
  }

  String? currency() {
    if (category != QrCategories.upi) return null;

    const String currencyKey = "cu";
    return _getValueFromKey(currencyKey);
  }

  String? merchantName() {
    if (category != QrCategories.upi) return null;

    const String merchantNameKey = "tn";
    return _getValueFromKey(merchantNameKey);
  }

  String? id() {
    if (category == QrCategories.upi || category == QrCategories.unknown)
      return null;

    const String idKey = "id=";
    return _getValueFromKey(idKey);
  }

  GroupCategories? groupCategory() {
    if (category != QrCategories.group) return null;

    const String categoryKey = "cat=";
    String? categoryName = _getValueFromKey(categoryKey);

    if (categoryName != null)
      for (var cat in GroupCategories.values) {
        if (cat.name == categoryName) return cat;
      }
    return null;
  }

  String label() {
    switch (category) {
      case QrCategories.friend:
        return Constants.slFriend;
      case QrCategories.group:
        return Constants.slGroup;
      case QrCategories.upi:
        return Constants.slPayment;
      case QrCategories.unknown:
      default:
        return "???";
    }
  }

  @override
  String toString() {
    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.writeAll([
      "Category :: ${category.name}",
      "Name :: ${name()}",
      "Id :: ${id()}",
      "UPI :: ${upiID()}",
      "Amount :: ${amount()}",
      "Currency :: ${currency()}",
      "MerchantName :: ${merchantName()}"
    ], "\n");
    return stringBuffer.toString();
  }
}
