import 'package:flutter/material.dart';
import 'package:zone_store/models/product.dart';
import 'package:zone_store/widgets/banner.widget.dart';
import 'package:zone_store/values/colors.dart' as colors;
import 'package:zone_store/widgets/rating.widget.dart';

class DetailPage extends StatefulWidget {
  final Product product;
  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailPage(product: product);
}

class _DetailPage extends State<DetailPage> {
  final Product product;
  final controller = PageController(viewportFraction: 1, keepPage: true);
  _DetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(product.name ?? ""),
        ),
        body: Container(
            padding: EdgeInsets.only(bottom: 100),
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                ListView(children: [imageProducts(), productTitle()]),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      Size(double.maxFinite, 36)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0)))),
                              child: Text("Add to cart"),
                              onPressed: () => {},
                            ))))
              ],
            )));
  }

  Widget imageProducts() {
    List<Widget> imageWidgets = <Widget>[
      Container(
        color: colors.accentLightColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(product.assetName,
              package: product.assetPackage, fit: BoxFit.fitWidth),
        ),
      ),
      Container(
        color: colors.accentLightColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(product.assetName,
              package: product.assetPackage, fit: BoxFit.fitWidth),
        ),
      ),
      Container(
        color: colors.accentLightColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(product.assetName,
              package: product.assetPackage, fit: BoxFit.fitWidth),
        ),
      ),
      Container(
        color: colors.accentLightColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(product.assetName,
              package: product.assetPackage, fit: BoxFit.fitWidth),
        ),
      ),
    ];
    return Container(
      height: 200.0,
      child: AppBanner(childs: imageWidgets, controller: controller),
    );
  }

  Widget productTitle() {
    return Container(
        margin: EdgeInsets.all(16),
        child: Row(children: [
          Expanded(
              child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name ?? ""),
                  Text("${product.price.toString()}\$"),
                  StarRating(
                    rating: 3.5,
                    color: Colors.yellow,
                    starSize: 16,
                  ),
                ]),
          ))
        ]));
  }
}
