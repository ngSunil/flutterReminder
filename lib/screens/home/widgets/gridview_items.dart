import 'package:flutter/material.dart';
import 'package:ios_reminders/models/categories/category.dart';

class GridviewItems extends StatelessWidget {
  const GridviewItems({required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 16 / 9,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: categories
            .map(
              (category) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 40, 40, 42),
                ),
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            category.icon,
                            category.status,
                            Text(
                              category.reminderCount.toString(),
                              style: Theme.of(context).textTheme.headline6,
                            )
                          ],
                        ),
                        Text(
                          category.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList());
  }
}
