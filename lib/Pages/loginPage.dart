import 'package:flutter/material.dart';
import 'package:study_habits/Pages/homepage.dart';
import 'package:study_habits/Pages/signupPage.dart';

class LoginPage extends StatefulWidget {
  static String route = '/login';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: const Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: 'Task',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                )),
            TextSpan(
              text: 'It',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                color: Colors.cyan,
              ),
            ),
          ],
        ),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'test@test.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'admin',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(HomePage.route);
        },
        padding: EdgeInsets.all(12),
        color: Colors.cyan,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    final signUpLabel = FlatButton(
      child: Text(
        'New to TaskIt? Sign Up!',
        style: TextStyle(
          color: Colors.black54,
          decoration: TextDecoration.underline,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(SignUpPage.route);
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            signUpLabel,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
