import 'package:flutter/material.dart';
import 'package:study_habits/pages/homepage.dart';
import 'package:study_habits/pages/signupPage.dart';

class LoginPage extends StatefulWidget {
  static String route = '/login';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;

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

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    final signUpLabel = FlatButton(
      child: Text(
        'New to TaskIt? Create an account!',
        style: TextStyle(
          color: Colors.black87,
          decoration: TextDecoration.underline,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(SignUpPage.route);
      },
    );

    Widget _loginBody() {
      return SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  logo,
                  SizedBox(height: 32.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    initialValue: 'test@test.com',
                    validator: (val) => val.isEmpty || val != 'test@test.com'
                        ? 'Enter a valid email'
                        : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    autofocus: false,
                    initialValue: 'admin123',
                    obscureText: _hidePassword,
                    validator: (val) =>
                        val != 'admin123' ? 'Enter valid password' : null,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: (_hidePassword)
                            ? Icon(Icons.remove_red_eye)
                            : Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                      ),
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  SizedBox(
                    height: 48,
                    width: 450,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.of(context).pushNamed(HomePage.route);
                        }
                      },
                      padding: EdgeInsets.all(12),
                      color: Colors.cyan,
                      child: Text('Log In',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  signUpLabel,
                  forgotLabel
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: _loginBody(),
    );
  }
}
