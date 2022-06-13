import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExploreTab();
}

class _ExploreTab extends State<ExploreTab>
    with AutomaticKeepAliveClientMixin<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    Size _screen = MediaQuery.of(context).size;
    return Container(
        height: _screen.height,
        width: _screen.width,
        child: GridView.custom(
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: [
              QuiltedGridTile(2, 2),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => _itemImage(index),
          ),
        ));
  }

  Widget _itemImage(int index) {
    return GestureDetector(
        onLongPress: () => {_openCustomDialog(index)},
        child: Image.asset("${index % 30}-0.jpg",
            package: "shrine_images", fit: BoxFit.cover));
  }

  @override
  bool get wantKeepAlive => true;

  void _openCustomDialog(int index) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                content: Image.asset("${index % 30}-0.jpg",
                    package: "shrine_images", fit: BoxFit.cover),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Text("data");
        });
  }
}
