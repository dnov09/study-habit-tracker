import 'package:flutter/material.dart';
import 'package:study_habits/Pages/homepage.dart';
import 'package:study_habits/Pages/loginPage.dart';

class SignUpPage extends StatefulWidget {
  static String route = '/sign-up';
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
              ),
            ),
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
      validator: (val) => val.isEmpty ? 'Enter an email' : null,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'admin123',
      validator: (val) =>
          val.length < 6 ? 'Enter a password 6+ chars long' : null,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final reEnterPassword = TextFormField(
      autofocus: false,
      initialValue: 'admin123',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Re-enter Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final signUpButton = Padding(
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
        child: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Already have an account? Sign in',
        style: TextStyle(
            color: Colors.black54, decoration: TextDecoration.underline),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(LoginPage.route);
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
            SizedBox(height: 8.0),
            reEnterPassword,
            SizedBox(height: 24.0),
            signUpButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
