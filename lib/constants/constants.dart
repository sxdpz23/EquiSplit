import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

abstract class Constants {
  static bool darkModeEnabled = false;

  static const String APP_NAME = 'EquiSplit';
  static const String APP_DESC =
      "Effortlessly split expenses and manage shared finances on the go! \n\nWhether it's splitting bills with friends, managing household expenses, or organizing group finances, EquiSplit has you covered. \n\nCreate groups, add members, and track shared expenses with ease. \n\nStay on top of your finances and enjoy hassle-free money management with EquiSplit!";

  static String userName = "Shantanu";
  static const String userImage =
      "https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  /// Commons
  static const String debugFAB = "FAB pressed :: ";
  static const String debugPIC = "Profile Picture Tapped :: ";

  /// Home Page
  static const String msgOwe = "Overall, you owe ";
  static const String msgOwed = "Overall, you are owe ";

  // Home Tile
  static const String dummyGroupImage =
      "https://images.unsplash.com/photo-1615332859295-aa9dc9f01fbc?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  /// Scanner Page
  static const int darkValueForScannerNegative = 189;

  /// Scanned Card Labels
  static const String slGroup = "Join Group";
  static const String slFriend = "Add Friend";
  static const String slPayment = "Pay";

  static const Duration allDuration = Durations.medium2;

  /// Add Categories on fab
  static const List<String> tooltips = ["Group", "Expense", "Friend"];
  static const List<IconData> icons = [
    Icons.group,
    FontAwesome.rupee,
    Icons.person
  ];
}
