import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Edit',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 16 / 9,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: EdgeInsets.all(10),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 40, 40, 42),
                    ),
                  ),
                  Container(color: Colors.orange),
                  Container(color: Colors.white),
                  Container(color: Colors.green),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle),
                    label: const Text('New Reminder'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Add List'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
