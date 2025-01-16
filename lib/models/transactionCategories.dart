import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

enum TransactionCategories { expense, income, transferIn, transferOut }

class TransactionSubCategory {
  String label;
  IconData icon;
  bool? plus;
  double amount;
  // TransactionCategories category;

  TransactionSubCategory(
      {required this.label,
      required this.icon,
      required this.plus,
      // required this.category,
      this.amount = 0.00});
}

class TransactionCategoriesData {
  TransactionCategoriesData({required this.category});

  TransactionCategories category;

  TransactionSubCategory _createSubCat(
      String label, IconData icon, bool? plus) {
    return TransactionSubCategory(
      // category: category,
      label: label, icon: icon, plus: plus,
    );
  }

  List<TransactionSubCategory> getSubCategories() {
    List<TransactionSubCategory> returnList;
    switch (category) {
      case TransactionCategories.expense:
        returnList = [
          _createSubCat("Food & Drink", FontAwesome.cutlery, false),
          _createSubCat("Shopping", FontAwesome.shopping_bag, false),
          _createSubCat("Transport", FontAwesome.train, false),
          _createSubCat("Home", FontAwesome.home, false),
          _createSubCat("Bills & Fees", FontAwesome.money, false),
          _createSubCat("Entertainment", FontAwesome.television, false),
          _createSubCat("Car", FontAwesome.car, false),
          _createSubCat("Travel", FontAwesome.plane, false),
          _createSubCat("Family & Personal", FontAwesome.user, false),
          _createSubCat("Healthcare", FontAwesome.hospital_o, false),
          _createSubCat("Education", FontAwesome.adjust, false), // school
          _createSubCat("Groceries", FontAwesome.shopping_cart, false),
          _createSubCat("Gifts", FontAwesome.gift, false),
          _createSubCat("Sports & Hobbies", FontAwesome.soccer_ball_o, false),
          _createSubCat("Beauty", FontAwesome.adjust, false), // flower
          _createSubCat("Work", FontAwesome.briefcase, false),
          _createSubCat("Other", FontAwesome.question_circle_o, false)
        ];
        break;
      case TransactionCategories.income:
        returnList = [
          _createSubCat("Salary", FontAwesome.rupee, true),
          _createSubCat("Business", FontAwesome.black_tie, true),
          _createSubCat("Gifts", FontAwesome.gift, true),
          _createSubCat("Extra Income", FontAwesome.money, true),
          _createSubCat("Loan", FontAwesome.adjust, true),
          _createSubCat("Parental Leave", FontAwesome.adjust, true), // family
          _createSubCat(
              "Insurance Payout", FontAwesome.adjust, true), // insurance
          _createSubCat("Other", FontAwesome.question_circle_o, true),
        ];
        break;
      default:
        returnList = [
          _createSubCat("Self Account", FontAwesome.arrows_h, null),
          _createSubCat("Friend", FontAwesome.arrows_alt, null),
          _createSubCat("Other", FontAwesome.question_circle_o, null)
        ];
    }
    return returnList;
  }
}
