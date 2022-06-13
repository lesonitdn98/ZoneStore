import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Center(child: _registerForm()));
  }

  Widget _registerForm() {
    return Center(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 32),
          child: Center(
              child: Text(
            "Sign Up",
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
            margin: EdgeInsets.all(16),
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  labelText: 'Re-enter password',
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
              child: Text("Sign Up"),
              onPressed: () => {},
            ))
      ],
    ));
  }
}
