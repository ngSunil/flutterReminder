import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ios_reminders/models/common/custom_color.dart';

class CustomColorCollection {
  final List<CustomColor> _colors = [
    CustomColor(id: 'blue_accent', color: Colors.blueAccent),
    CustomColor(id: 'orange', color: Colors.orange),
    CustomColor(id: 'red_accent', color: Colors.redAccent),
    CustomColor(id: 'light_green', color: Colors.lightGreen),
    CustomColor(id: 'pink_accent', color: Colors.pinkAccent),
    CustomColor(id: 'brown', color: Colors.brown),
  ];

  UnmodifiableListView<CustomColor> get colors => UnmodifiableListView(_colors);

  CustomColor findColorById(id) {
    debugPrint(id);
    return _colors.firstWhere((customColor) => customColor.id == id);
  }
}
