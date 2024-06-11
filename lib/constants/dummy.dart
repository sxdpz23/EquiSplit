import 'package:equisplit/models/groupCategories.dart';

abstract class DummyData {
  static const List<GroupCategories> groupsSynced = [
    GroupCategories.couples,
    GroupCategories.trip,
    GroupCategories.others,
    GroupCategories.home,
    GroupCategories.business,
    GroupCategories.trip,
  ];

  static const List<GroupCategories> groupsSynced2 = [
    GroupCategories.couples,
    GroupCategories.home,
    GroupCategories.business,
  ];
}
