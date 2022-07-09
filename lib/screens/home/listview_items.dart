import 'package:flutter/material.dart';
import 'package:ios_reminders/models/category_collection.dart';

class ListViewItems extends StatefulWidget {
  @override
  State<ListViewItems> createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {
  final CategoryCollection categoryCollection = CategoryCollection();

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: (oldIndex, newIndex) {
        // print('$oldIndex >> $newIndex');
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final item = categoryCollection.removeItem(oldIndex);
        setState(() {
          categoryCollection.insert(newIndex, item);
        });
      },
      children: categoryCollection.categories
          .map((category) => ListTile(
                onTap: () {
                  setState(() {
                    category.toggleCheckBox();
                  });
                },
                key: UniqueKey(),
                tileColor: Colors.grey[800],
                leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: category.isChecked
                          ? Colors.blueGrey
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: category.isChecked
                              ? Colors.blueGrey
                              : Colors.blueGrey)),
                  child: Icon(
                    Icons.check,
                    color:
                        category.isChecked ? Colors.white : Colors.transparent,
                  ),
                ),
                title: Row(
                  children: [
                    category.icon,
                    const SizedBox(
                      width: 10,
                    ),
                    Text(category.name),
                  ],
                ),
                trailing: const Icon(Icons.reorder),
              ))
          .toList(),
    );
  }
}
