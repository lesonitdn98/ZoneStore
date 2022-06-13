import 'package:flutter/material.dart';

class VouchersTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VouchersTab();
}

class _VouchersTab extends State<VouchersTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: ListView(children: [_itemVoucher(), _itemVoucher()]));
  }

  Widget _itemVoucher() {
    return Container(
        margin: EdgeInsets.only(bottom: 8),
        child: Card(
            child: Row(children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                "1-0.jpg",
                package: "shrine_images",
                fit: BoxFit.cover,
                height: 60.0,
                width: 60.0,
              )),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Voucher ABCXYZ")]))
        ])));
  }
}
