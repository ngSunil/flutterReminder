import 'package:flutter/material.dart';
import 'package:ios_reminders/models/category_collection.dart';
import 'package:ios_reminders/screens/home/gridview_items.dart';
import 'package:ios_reminders/screens/home/listview_items.dart';
import 'footer.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String layoutType = 'grid';

  final CategoryCollection categoryCollection = CategoryCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              print(categoryCollection.selectedCategories);
              if (layoutType == 'grid') {
                setState(() {
                  layoutType = 'list';
                });
              } else {
                setState(() {
                  layoutType = 'grid';
                });
              }
            },
            child: Text(
              layoutType == 'grid' ? 'Edit' : 'Done',
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: layoutType == 'grid'
                ? GridviewItems(
                    categories: categoryCollection.selectedCategories)
                : ListViewItems(),
          ),
          Footer()
        ],
      ),
    );
  }
}
