import 'package:flutter/material.dart';
import 'package:ios_reminders/screens/auth/sign_in.dart';
import 'package:ios_reminders/screens/auth/sign_up.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({super.key});

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  bool _showSignInScreen = true;
  void toggleView() {
    print('signup');
    setState(() {
      _showSignInScreen = !_showSignInScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: _showSignInScreen
          ? SignInScreen(toggleView: toggleView)
          : SignUpScreen(toggleView: toggleView),
    );
  }
}
