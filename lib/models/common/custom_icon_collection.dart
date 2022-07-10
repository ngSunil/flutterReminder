import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:ios_reminders/models/common/custom_icon.dart';

class CustomIconCollection {
  final List<CustomIcon> _icons = [
    CustomIcon(id: 'bars', icon: CupertinoIcons.bars),
    CustomIcon(id: 'alarm', icon: CupertinoIcons.alarm),
    CustomIcon(id: 'airplane', icon: CupertinoIcons.airplane),
    CustomIcon(id: 'wave_form_path', icon: CupertinoIcons.waveform_path),
    CustomIcon(id: 'person', icon: CupertinoIcons.person),
    CustomIcon(id: 'calendar_today', icon: CupertinoIcons.calendar_today),
  ];

  UnmodifiableListView<CustomIcon> get icons => UnmodifiableListView(_icons);

  CustomIcon getIcon(id) {
    return _icons.firstWhere((customIcon) => customIcon.id = id);
  }
}
