import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback toggleView;

  const SignUpScreen({super.key, required this.toggleView});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTextController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                widget.toggleView();
              });
            },
            icon: const Icon(Icons.person),
            label: Text('Sign In'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Lottie.asset('assets/images/calendar.json', width: 175),
          Text('Yet another to do list'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            InputDecoration(hintText: "Enter your Username"),
                        validator: (val) => val == null || !val.contains('@')
                            ? 'Please enter a valid email address'
                            : null),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration:
                          InputDecoration(hintText: "Enter your Username"),
                      obscureText: true,
                      validator: (val) => val!.length < 6
                          ? 'Enter a more secure password'
                          : null,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('submit form');
                          }
                          ;
                        },
                        child: const Text('Sign Up'))
                  ],
                )),
          )
        ]),
      ),
    );
  }
}
