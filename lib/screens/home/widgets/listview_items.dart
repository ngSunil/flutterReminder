import 'package:flutter/material.dart';
import 'package:ios_reminders/models/categories/category_collection.dart';

const double LISTVIEW_HEIGHT = 70.0;

class ListViewItems extends StatefulWidget {
  final CategoryCollection collection;
  const ListViewItems({Key? key, required this.collection}) : super(key: key);

  @override
  State<ListViewItems> createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {
  CategoryCollection get categoryCollection => widget.collection;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: categoryCollection.categories.length * LISTVIEW_HEIGHT,
      child: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            // print('reordered list');
            print('oldIndex $oldIndex');
            print('newIndex $newIndex');
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }

            final item = categoryCollection.removeItem(oldIndex);
            setState(() {
              categoryCollection.insert(newIndex, item);
            });
          },
          children: categoryCollection.categories
              .map(
                (category) => SizedBox(
                  key: UniqueKey(),
                  height: LISTVIEW_HEIGHT,
                  child: ListTile(
                    onTap: () {
                      //toggle checkbox
                      setState(() {
                        category.toggleCheckBox();
                      });
                    },
                    tileColor: Colors.grey[800],
                    leading: Container(
                      decoration: BoxDecoration(
                          color: category.isChecked
                              ? Colors.blueAccent
                              : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: category.isChecked
                                  ? Colors.blueAccent
                                  : Colors.grey)),
                      child: Icon(
                        Icons.check,
                        color: category.isChecked
                            ? Colors.white
                            : Colors.transparent,
                      ),
                    ),
                    title: Row(
                      children: [
                        category.icon,
                        SizedBox(width: 10),
                        Text(category.name),
                      ],
                    ),
                    trailing: Icon(Icons.reorder),
                  ),
                ),
              )
              .toList()),
    );
  }
}
