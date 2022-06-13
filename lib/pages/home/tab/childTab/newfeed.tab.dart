import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone_store/values/colors.dart' as colors;

class NewFeedTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewFeedTab();
}

class _NewFeedTab extends State<NewFeedTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [_status(), _status(), _status(), _status()]);
  }

  Widget _status() {
    return Container(
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Card(
            elevation: 3,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_header(), _body(), _reaction(), _action()])));
  }

  Widget _header() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Row(children: [
          CircleAvatar(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    "0-0.jpg",
                    package: "shrine_images",
                    fit: BoxFit.cover,
                    height: 100.0,
                    width: 100.0,
                  ))),
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Son Le"), Text("2h")]),
          ))
        ]));
  }

  Widget _body() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("This is a status demo!"),
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 16, top: 10),
          ),
          Container(
            height: 160,
            width: double.maxFinite,
            child: Image.asset(
              "0-0.jpg",
              package: "shrine_images",
              fit: BoxFit.fitHeight,
              height: 100.0,
              width: 100.0,
            ),
          )
        ]);
  }

  Widget _reaction() {
    return Container(
        margin: EdgeInsets.only(top: 4, left: 10, right: 10),
        child: Row(children: [
          Icon(
            CupertinoIcons.heart_circle_fill,
            color: Colors.red,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Text("Son Le and 999 others"),
          )
        ]));
  }

  Widget _action() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Divider(color: colors.primaryColor),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(children: [
                Expanded(
                    child: SizedBox(
                        height: 32.0,
                        child: CupertinoButton(
                            padding: new EdgeInsets.all(0.0),
                            child: Icon(CupertinoIcons.heart,
                                size: 20, color: colors.primaryColor),
                            onPressed: () {}))),
                Expanded(
                    child: SizedBox(
                        height: 32.0,
                        child: CupertinoButton(
                            padding: new EdgeInsets.all(0.0),
                            child: Icon(CupertinoIcons.bubble_left,
                                size: 20, color: colors.primaryColor),
                            onPressed: () {}))),
                Expanded(
                    child: SizedBox(
                        height: 32.0,
                        child: CupertinoButton(
                            padding: new EdgeInsets.all(0.0),
                            child: Icon(CupertinoIcons.arrowshape_turn_up_right,
                                size: 20, color: colors.primaryColor),
                            onPressed: () {})))
              ]))
        ]));
  }
}
