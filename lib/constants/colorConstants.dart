import 'package:flutter/material.dart';

abstract class ColorConstants {
  static const Color _bgDark = Color(0xff121212);
  static const Color _bgLight = Colors.white;

  static const Color appBarBG = _bgLight;
  static const Color appBarTXT = Colors.blueAccent;

  static const Color pageBG = _bgLight;
  static const Color pageTXT = Colors.black;
  static const Color pageFG = Color(0xff0b19de);
  static const Color pageFGTXT = Colors.white;

  static const Color youOwe = Colors.deepOrangeAccent;
  static const Color youAreOwed = Colors.greenAccent;

  static const Color scannerFocusBox = Colors.white;
  static const Color scannerTXT = Colors.white;
  static const Color scannerFG = Color(0xff0b19de);
  static const Color scannerBG = Colors.black;

  /// Group Categories colors
  static const Color gcCouples = Colors.pinkAccent;
  static const Color gcHome = Colors.lightBlueAccent;
  static const Color gcTrip = Colors.teal;
  static const Color gcBusiness = Colors.orange;
  static const Color gcOthers = Colors.grey;

  /// QR Scanner Categories colors
  static const Color qcFriend = Colors.indigoAccent;
  static const Color qcGroup = Colors.transparent;
  static const Color qcPayments = Colors.brown;
  static const Color qcUnknown = Colors.redAccent;
}
