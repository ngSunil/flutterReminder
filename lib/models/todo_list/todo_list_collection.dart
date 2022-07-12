import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ios_reminders/models/todo_list/todo_list.dart';

class ToDoListCollection with ChangeNotifier {
  final List<ToDoList> _todolists = [];
  UnmodifiableListView<ToDoList> get todolists =>
      UnmodifiableListView(_todolists);

  addToDoList(ToDoList todoList) {
    _todolists.add(todoList);
    notifyListeners();
  }

  removeToDoList(ToDoList todoList) {
    _todolists.removeWhere((element) => element.id == todoList.id);
    notifyListeners();
  }
}
