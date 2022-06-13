import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zone_store/blocs/home.bloc.dart';
import 'package:zone_store/models/product.dart';
import 'package:zone_store/pages/detail/product.detail.page.dart';
import 'package:zone_store/pages/search/search.page.dart';
import 'package:zone_store/widgets/banner.widget.dart';
import 'package:zone_store/values/colors.dart' as colors;
import 'package:zone_store/widgets/product.grid.list.dart';
import 'package:zone_store/widgets/product.list.dart';

class ProductListTab extends StatefulWidget {
  const ProductListTab({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ProductListTab();
}

class _ProductListTab extends State<ProductListTab> {
  late HomeBloc bloc;
  final controller = PageController(viewportFraction: 1, keepPage: true);

  final List<Widget> bannerWidgets = <Widget>[
    Container(
      color: colors.accentLightColor,
      child: Center(
        child: Text("Banner 1"),
      ),
    ),
    Container(
      color: colors.accentLightColor,
      child: Center(
        child: Text("Banner 2"),
      ),
    ),
    Container(
      color: colors.accentLightColor,
      child: Center(
        child: Text("Banner 3"),
      ),
    )
  ];

  final List<Product> products = List<Product>.generate(
      30,
      (index) => Product(
          id: index,
          name: "Product ${index + 1}",
          price: (10.0 + index),
          count: (index + 10)));

  int currentPageValue = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = bloc = Provider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Zone Store"),
          centerTitle: false,
          actions: [
            CupertinoButton(
                onPressed: () {
                  _search();
                },
                child: Icon(
                  CupertinoIcons.search,
                  color: colors.primaryColor,
                  semanticLabel: 'Search',
                ))
          ],
        ),
        body: ListView(children: [banner(), mostPopular(), recommend()]));
  }

  Widget banner() {
    return Container(
      height: 200.0,
      child: AppBanner(childs: bannerWidgets, controller: controller),
    );
  }

  Widget mostPopular() {
    return ProductList(
        title: "Most popular",
        products: products,
        itemClick: (product) => {_productDetail(product)});
  }

  Widget recommend() {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(children: [
          Container(
              padding: EdgeInsets.all(16),
              child: Row(children: [
                Expanded(child: Text("Recommend")),
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
          ProductGridView(
              products: products,
              itemClick: (product) => {_productDetail(product)})
        ]));
  }

  _search() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return SearchPage();
    }));
  }

  _productDetail(Product product) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return DetailPage(product: product);
    }));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
