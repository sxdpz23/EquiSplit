import 'package:equisplit/constants/colorConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

enum GroupCategories { trip, couples, home, others, business }

class GroupCategoriesData {
  GroupCategoriesData({required this.category});

  final GroupCategories category;

  String name() {
    return category.name[0].toUpperCase() + category.name.substring(1);
  }

  Color color() {
    switch (category) {
      case GroupCategories.couples:
        return ColorConstants.gcCouples;
      case GroupCategories.trip:
        return ColorConstants.gcTrip;
      case GroupCategories.home:
        return ColorConstants.gcHome;
      case GroupCategories.business:
        return ColorConstants.gcBusiness;
      case GroupCategories.others:
        return ColorConstants.gcOthers;
    }
  }

  IconData icon() {
    switch (category) {
      case GroupCategories.couples:
        return CupertinoIcons.heart_fill;
      case GroupCategories.trip:
        return CupertinoIcons.airplane;
      case GroupCategories.home:
        return FontAwesome.home;
      case GroupCategories.business:
        return MaterialIcons.work;
      case GroupCategories.others:
        return CupertinoIcons.archivebox_fill;
    }
  }
}
