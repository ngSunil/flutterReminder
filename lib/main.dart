import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminders/models/todo_list/todo_list.dart';
import 'package:ios_reminders/models/todo_list/todo_list_collection.dart';
import 'package:ios_reminders/screens/add_list/add_list_screen.dart';
import 'package:ios_reminders/screens/add_reminder/add_reminder_screen.dart';
import 'package:ios_reminders/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("There was an error!!!"));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return ChangeNotifierProvider<ToDoListCollection>(
            create: (BuildContext context) => ToDoListCollection(),
            child: MaterialApp(
              initialRoute: '/',
              routes: {
                '/': (context) => const HomeScreen(),
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
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
