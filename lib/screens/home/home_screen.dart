import 'package:flutter/material.dart';
import 'package:ios_reminders/models/categories/category_collection.dart';
import 'package:ios_reminders/screens/home/widgets/listview_items.dart';
import 'package:ios_reminders/screens/home/widgets/gridview_items.dart';
import 'package:ios_reminders/screens/home/widgets/footer.dart';

enum LayoutType { grid, list }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LayoutType layoutType = LayoutType.grid;

  final CategoryCollection categoryCollection = CategoryCollection();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (layoutType == LayoutType.grid) {
                setState(() {
                  layoutType = LayoutType.list;
                });
              } else {
                setState(() {
                  layoutType = LayoutType.grid;
                });
              }
            },
            child: Text(
              layoutType == LayoutType.grid ? 'Edit' : 'Done',
              // style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: layoutType == LayoutType.grid
                ? GridviewItems(
                    categories: categoryCollection.selectedCategories)
                : ListViewItems(collection: categoryCollection),
          ),
          const Footer()
        ],
      ),
    );
  }
}
