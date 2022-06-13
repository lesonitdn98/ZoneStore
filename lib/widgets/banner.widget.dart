import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zone_store/values/colors.dart' as colors;

class AppBanner extends StatefulWidget {
  final List<Widget> childs;
  final PageController controller;
  const AppBanner({Key? key, required this.childs, required this.controller})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _Banner(childs, controller);
}

class _Banner extends State<AppBanner> {
  final List<Widget> childs;
  final PageController controller;
  _Banner(this.childs, this.controller);

  int currentPageValue = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 8), (Timer t) {
      if (controller.hasClients) {
        currentPageValue == (childs.length - 1)
            ? currentPageValue = 0
            : currentPageValue++;
        currentPageValue == 0
            ? controller.jumpToPage(currentPageValue)
            : controller.animateToPage(currentPageValue,
                duration: Duration(seconds: 1), curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomCenter, children: [
      PageView.builder(
          physics: ClampingScrollPhysics(),
          controller: controller,
          itemCount: childs.length,
          onPageChanged: (int page) {
            currentPageValue = page;
          },
          itemBuilder: (content, index) {
            return childs[index];
          }),
      Container(
          margin: EdgeInsets.only(bottom: 12),
          child: SmoothPageIndicator(
              controller: controller,
              count: childs.length,
              effect: ExpandingDotsEffect(
                expansionFactor: 2,
                activeDotColor: colors.malibu,
                dotColor: colors.geyser,
                radius: 4,
                spacing: 4,
                dotHeight: 8,
                dotWidth: 8,
              )))
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}
