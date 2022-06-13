import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarSearch extends StatelessWidget {
  const AppBarSearch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CupertinoButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(CupertinoIcons.back)),
      Expanded(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              margin: EdgeInsets.only(right: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    hintText: 'Search',
                    isDense: true,
                    contentPadding: EdgeInsets.all(10)),
              )))
    ]);
  }
}
