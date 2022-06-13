import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: _loginForm());
  }

  Widget _loginForm() {
    return Center(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 32),
          child: Center(
              child: Text(
            "Login",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
          )),
        ),
        Container(
            margin: EdgeInsets.all(16),
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  labelText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)))),
            )),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)))),
            )),
        Container(
            width: double.maxFinite,
            margin: EdgeInsets.all(16),
            child: ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(double.maxFinite, 48)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
              child: Text("Login"),
              onPressed: () => {},
            )),
        Container(
          child:
              Center(child: GestureDetector(child: Text("Forgot password?"))),
        )
      ],
    ));
  }
}
