import 'dart:collection';

import 'package:ios_reminders/common/widgets/categoryIcon.dart';
import 'package:ios_reminders/common/widgets/status.dart';
import 'package:ios_reminders/models/categories/category.dart';
import 'package:flutter/material.dart';

class CategoryCollection {
  final List<Category> _categories = [
    Category(
        reminderCount: 0,
        name: 'Today',
        icon:
            CategoryIcon(bgColor: Colors.blue, iconData: Icons.calendar_today),
        status: StatusWidget(
          bgColor: Colors.orangeAccent,
          statusText: "OK",
        )),
    Category(
        reminderCount: 0,
        name: 'Scheduled',
        icon: CategoryIcon(bgColor: Colors.red, iconData: Icons.calendar_month),
        status: StatusWidget(
          bgColor: Colors.blue,
          statusText: "Not Ok",
        )),
    Category(
        reminderCount: 0,
        name: 'All',
        icon: CategoryIcon(bgColor: Colors.grey, iconData: Icons.inbox),
        status: StatusWidget(
          bgColor: Colors.red,
          statusText: "Not Ok",
        )),
    Category(
        reminderCount: 0,
        name: 'Flagged',
        icon: CategoryIcon(bgColor: Colors.orange, iconData: Icons.flag),
        status: StatusWidget(
          bgColor: Colors.blueAccent,
          statusText: "Not Ok",
        )),
  ];
  UnmodifiableListView<Category> get categories =>
      UnmodifiableListView(_categories);
// unmodifiable listview so that it cannot be edited from outside and getter also so that directly list is not exposed to the outside world
// create methods for removing and adding items here instead of getting the list and modyfiyng throguh on a different widget
  Category removeItem(index) {
    return _categories.removeAt(index);
  }

  void insert(index, item) {
    _categories.insert(index, item);
  }

  List<Category> get selectedCategories {
    // _categories.forEach((element) {
    //   debugPrint("Name ::: ${element.name}");
    //   debugPrint("iS selected ::: ${element.isChecked}");
    // });
    return _categories.where((element) => element.isChecked).toList();
  }
}
