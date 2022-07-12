import 'package:flutter/material.dart';
import 'package:ios_reminders/common/widgets/categoryIcon.dart';
import 'package:ios_reminders/models/common/custom_color_collection.dart';
import 'package:ios_reminders/models/common/custom_icon_collection.dart';
import 'package:ios_reminders/models/todo_list/todo_list.dart';
import 'package:ios_reminders/models/todo_list/todo_list_collection.dart';
import 'package:provider/provider.dart';

class todoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoLists = Provider.of<ToDoListCollection>(context).todolists;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Lists",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 70),
                shrinkWrap: true,
                itemCount: todoLists.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      Provider.of<ToDoListCollection>(context, listen: false)
                          .removeToDoList(todoLists[index]);
                    },
                    key: UniqueKey(),
                    background: Container(
                      alignment: AlignmentDirectional.centerEnd,
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Icon(Icons.delete),
                      ),
                    ),
                    child: Card(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      child: ListTile(
                        leading: CategoryIcon(
                          bgColor: (CustomColorCollection()
                              .findColorById(todoLists[index].icon['color'])
                              .color),
                          iconData: (CustomIconCollection()
                                  .getIcon(todoLists[index].icon["id"]))
                              .icon,
                        ),
                        title: Text(todoLists[index].title),
                        trailing: Text(
                          '0',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
