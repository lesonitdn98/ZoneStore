import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const TextStyle productRowItemName = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 13,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle productRowItemPrice = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle productRowTotal = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );
}
