import 'package:flutter/material.dart';
import 'package:zone_store/models/product.dart';
import 'package:zone_store/widgets/product.item.dart';

class ProductGridView extends StatefulWidget {
  final List<Product> products;
  final void Function(Product product) itemClick;
  const ProductGridView(
      {Key? key, required this.products, required this.itemClick})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _ProductGridView(products, itemClick);
}

class _ProductGridView extends State<ProductGridView> {
  final List<Product> products;
  final void Function(Product product) itemClick;
  _ProductGridView(this.products, this.itemClick);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: products.length,
        itemBuilder: (_, index) => ProductItem(
            product: products[index],
            imgHeight: 100,
            itemClick: () => itemClick(products[index])));
  }
}
