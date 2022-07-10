import 'package:ios_reminders/common/widgets/categoryIcon.dart';
import 'package:ios_reminders/common/widgets/status.dart';

class Category {
  final int reminderCount;
  final String name;
  bool isChecked;
  final CategoryIcon icon;
  final StatusWidget status;

  Category({
    required this.reminderCount,
    required this.name,
    this.isChecked = true,
    required this.icon,
    required this.status,
  });

  void toggleCheckBox() {
    isChecked = !isChecked;
  }
}
