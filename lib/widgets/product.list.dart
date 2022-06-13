import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone_store/models/product.dart';
import 'package:zone_store/values/colors.dart' as colors;
import 'package:zone_store/widgets/product.item.dart';

class ProductList extends StatefulWidget {
  final String title;
  final List<Product> products;
  final void Function(Product product) itemClick;
  const ProductList(
      {Key? key,
      required this.title,
      required this.products,
      required this.itemClick})
      : super(key: key);
  @override
  State<StatefulWidget> createState() =>
      _ProductList(title, products, itemClick);
}

class _ProductList extends State<ProductList> {
  final String title;
  final List<Product> products;
  final void Function(Product product) itemClick;
  _ProductList(this.title, this.products, this.itemClick);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: EdgeInsets.all(16),
          child: Row(children: [
            Expanded(child: Text(title)),
            GestureDetector(
                onTap: () {},
                child: Row(children: [
                  Text(
                    "Show more",
                    style: TextStyle(
                        color: colors.disabledTextColor, fontSize: 11),
                  ),
                  Icon(
                    CupertinoIcons.chevron_forward,
                    size: 16,
                    color: colors.disabledTextColor,
                  )
                ]))
          ])),
      Container(
          height: 170,
          child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductItem(
                    product: products[index],
                    imgHeight: 80,
                    itemClick: () => itemClick(products[index]));
              }))
    ]);
  }
}
