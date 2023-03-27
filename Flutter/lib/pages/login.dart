// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:studygini/pages/AuthService.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Issue Tracker",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "IndieFlower", fontSize: 50),
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 12.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 12.0),
                TextButton(
                  onPressed: () {
                    // Navigate to forgot password page
                  },
                  child: Text('Forgot Password?'),
                ),
                SizedBox(height: 12.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                  onPressed: () {
                    // Perform login functionality here till then it shows the next page
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(),
                  ),
                ),
                SizedBox(height: 12.0),
                SignInButton(
                  Buttons.Google,
                  onPressed: () {
                    // Perform sign in with Google functionality here
                    AuthService().signInWithGoogle();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
