import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone_store/models/product.dart';
import 'package:zone_store/values/styles.dart';
import 'package:zone_store/widgets/rating.widget.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final void Function() itemClick;
  final double? imgHeight;
  final double? imgWidth;
  ProductItem(
      {required this.product,
      required this.itemClick,
      this.imgHeight,
      this.imgWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16),
        child: GestureDetector(
          child: Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      product.assetName,
                      package: product.assetPackage,
                      fit: BoxFit.fitWidth,
                      height: imgHeight,
                      width: imgWidth,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product.name ?? "Name",
                          style: Styles.productRowItemName,
                        ),
                        StarRating(
                          rating: 3.5,
                          color: Colors.yellow,
                          starSize: 16,
                        ),
                        Text(
                          '\$${product.price}',
                          style: Styles.productRowItemPrice,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          onTap: itemClick,
        ));
  }
}
