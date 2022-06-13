import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:zone_store/blocs/home.bloc.dart';
import 'package:zone_store/pages/signin/signin.page.dart';
import 'package:zone_store/pages/signup/signup.page.dart';
import 'package:zone_store/values/colors.dart' as colors;

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CartTab();
}

class _CartTab extends State<CartTab> {
  late HomeBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              stops: [0.0, 0.2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [colors.salmon, Colors.white])),
      child: SafeArea(
          child: ListView(children: [
        _loginForm(),
        _orders(),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: colors.primaryColor,
              height: 0.5,
            )),
        _progressDelivery(),
        _menuItem("Zone Rewards"),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: colors.primaryColor,
              height: 0.5,
            )),
        _menuItem("Notification"),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: colors.primaryColor,
              height: 0.5,
            )),
        _menuItem("Recently viewed"),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: colors.primaryColor,
              height: 0.5,
            )),
        _menuItem("My reviews"),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: colors.primaryColor,
              height: 0.5,
            )),
        _menuItem("Settings"),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: colors.primaryColor,
              height: 0.5,
            )),
      ])),
    ));
  }

  Widget _loginForm() {
    return Container(
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(16),
                    width: 200,
                    child: OutlinedButton(
                        onPressed: () => {_signIn()},
                        child: Text("Login", style: TextStyle(fontSize: 12))))),
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(16),
                    width: 200,
                    child: OutlinedButton(
                        onPressed: () => {_signUp()},
                        child:
                            Text("Register", style: TextStyle(fontSize: 12)))))
          ],
        ));
  }

  Widget _orders() {
    return Container(
        child: Row(children: [
      Expanded(
          child: Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
              child: Row(children: [
                Icon(
                  CupertinoIcons.square_grid_2x2,
                  color: Colors.black54,
                  size: 20,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Orders",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.black))),
                Expanded(
                    child: GestureDetector(
                        child: Text("Purchased orders",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 11, color: Colors.black54)))),
                Icon(
                  CupertinoIcons.chevron_forward,
                  size: 16,
                  color: Colors.black54,
                )
              ])))
    ]));
  }

  Widget _progressDelivery() {
    return Container(
        child: Row(children: [
      Expanded(
          child: Container(
              height: 100,
              child: CupertinoButton(
                  onPressed: () => {},
                  child: Column(children: [
                    Icon(CupertinoIcons.chevron_down_circle),
                    Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(
                          "Wait for confirmation",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 11, color: Colors.black),
                        ))
                  ])))),
      Expanded(
          child: Container(
              height: 100,
              child: CupertinoButton(
                  onPressed: () => {},
                  child: Column(children: [
                    Icon(CupertinoIcons.cube_box),
                    Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(
                          "Wait to pick up the goods",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 11, color: Colors.black),
                        ))
                  ])))),
      Expanded(
          child: Container(
              height: 100,
              child: CupertinoButton(
                  onPressed: () => {},
                  child: Column(children: [
                    Icon(CupertinoIcons.rocket_fill),
                    Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(
                          "Delivery in progress",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 11, color: Colors.black),
                        ))
                  ])))),
      Expanded(
          child: Container(
              height: 100,
              child: CupertinoButton(
                  onPressed: () => {},
                  child: Column(children: [
                    Icon(CupertinoIcons.star_circle),
                    Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(
                          "Reviews",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 11, color: Colors.black),
                        ))
                  ]))))
    ]));
  }

  Widget _menuItem(String btnTitle) {
    return Container(
        margin: EdgeInsets.all(16),
        child: GestureDetector(
            child: Row(children: [
          Expanded(child: Text(btnTitle)),
          Icon(
            CupertinoIcons.chevron_forward,
            size: 16,
            color: Colors.black54,
          )
        ])));
  }

  _signIn() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return SignInPage();
    }));
  }

  _signUp() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return SignUpPage();
    }));
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
