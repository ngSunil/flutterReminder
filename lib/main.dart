import 'package:flutter/material.dart';
import 'package:ios_reminders/screens/add_list/add_list_screen.dart';
import 'package:ios_reminders/screens/add_reminder/add_reminder_screen.dart';
import 'package:ios_reminders/screens/home/home_screen.dart';

main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/add_list': (context) => const AddListScreen(),
        '/add_reminder ': ((context) => const AddReminderScreen()),
      },
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.black,
        // appBarTheme: const AppBarTheme(color: Colors.black),
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(color: Colors.black),
        scaffoldBackgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        dividerColor: Colors.grey[400],
        // accentColor: Colors.blueAccent,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary: Colors.blueAccent,
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
      ),
    );
  }
}
