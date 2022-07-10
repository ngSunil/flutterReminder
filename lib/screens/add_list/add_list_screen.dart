import 'package:flutter/material.dart';
import 'package:ios_reminders/models/common/custom_color.dart';
import 'package:ios_reminders/models/common/custom_color_collection.dart';
import 'package:ios_reminders/models/common/custom_icon.dart';
import 'package:ios_reminders/models/common/custom_icon_collection.dart';

class AddListScreen extends StatefulWidget {
  const AddListScreen({super.key});

  @override
  State<AddListScreen> createState() => _AddListScreenState();
}

class _AddListScreenState extends State<AddListScreen> {
  CustomColor _selectedColor = CustomColorCollection().colors.first;
  CustomIcon _selectedIcon = CustomIconCollection().icons.first;

  final TextEditingController _textController = TextEditingController();
  String listName = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textController.addListener(() {
      setState(() {
        listName = _textController.text;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New List'),
        actions: [
          TextButton(
            onPressed: listName.isNotEmpty
                ? () {
                    if (_textController.text.isNotEmpty) {
                      debugPrint('save to database');
                    } else {
                      debugPrint('please enter a text');
                    }
                  }
                : null,
            child: const Text("Add"),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: _selectedColor.color),
              child: Icon(
                _selectedIcon.icon,
                size: 80,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _textController,
                autofocus: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () => _textController.clear(),
                    icon: Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor),
                      child: const Icon(Icons.clear),
                    ),
                  ),
                ),

                // .copyWith(fontWeight: FontWeight.w900),
                // if you want to override the healdine 5
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (final customColor in CustomColorCollection().colors)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = customColor;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: customColor.color,
                          shape: BoxShape.circle,
                          border: _selectedColor.id == customColor.id
                              ? Border.all(color: Colors.grey[300]!, width: 2.0)
                              : null),
                    ),
                  )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (final customIcon in CustomIconCollection().icons)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIcon = customIcon;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          border: _selectedIcon.icon == customIcon.icon
                              ? Border.all(color: Colors.grey[300]!, width: 2.0)
                              : null),
                      child: Icon(
                        customIcon.icon,
                        size: 25,
                      ),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
