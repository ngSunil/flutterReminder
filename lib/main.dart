import 'package:flutter/material.dart';
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
      },
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.black,
        // appBarTheme: const AppBarTheme(color: Colors.black),
        brightness: Brightness.dark,
      ),
    );
  }
}
