enum Filters {
  allGroups,
  outstandingGroups,
  youOweGroups,
  groupsThatOwe,
  allFriends,
  outstandingFriends,
  youOwedFriends,
  friendsThatOwe
}

class CategoryFilters {
  CategoryFilters({required this.filters});

  final Filters filters;

  String mainCategory() {
    return filters.name.toLowerCase().contains('groups') ? 'Groups' : 'Friends';
  }

  String description() {
    String entity = mainCategory();
    String value = filters.name;
    if (value.contains('all'))
      return "All $entity";
    else if (value.contains('outstanding'))
      return "Outstanding Balances";
    else if (value.contains('youOwe'))
      return "Borrows";
    else
      return "Lends";
  }
}
