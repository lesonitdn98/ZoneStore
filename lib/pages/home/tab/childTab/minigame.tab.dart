import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zone_store/widgets/board_view.widget.dart';

class MiniGameTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MiniGameTab();
}

class _MiniGameTab extends State<MiniGameTab>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<MiniGameTab> {
  double _angle = 0;
  double _current = 0;
  late AnimationController _ctrl;
  late Animation _ani;
  List<Luck> _items = [
    Luck("Voucher 20%", "0-0.jpg", Colors.accents[0]),
    Luck("Good luck", "1-0.jpg", Colors.accents[2]),
    Luck("Voucher 10%", "2-0.jpg", Colors.accents[4]),
    Luck("Good luck", "3-0.jpg", Colors.accents[6]),
    Luck("Voucher 10%", "4-0.jpg", Colors.accents[8]),
    Luck("Good luck", "5-0.jpg", Colors.accents[10]),
    Luck("Voucher 30%", "6-0.jpg", Colors.accents[12]),
    Luck("Voucher 1%", "7-0.jpg", Colors.accents[14]),
  ];

  @override
  void initState() {
    super.initState();
    var _duration = Duration(milliseconds: 5000);
    _ctrl = AnimationController(vsync: this, duration: _duration);
    _ani = CurvedAnimation(parent: _ctrl, curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green, Colors.blue.withOpacity(0.2)])),
        child: AnimatedBuilder(
            animation: _ani,
            builder: (context, child) {
              final _value = _ani.value;
              final _angle = _value * this._angle;
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  BoardView(items: _items, current: _current, angle: _angle),
                  _buildGo(),
                  _buildResult(_value),
                ],
              );
            }),
      ),
    );
  }

  _buildGo() {
    return Material(
      color: Colors.white,
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          height: 72,
          width: 72,
          child: Text(
            "GO",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: _animation,
      ),
    );
  }

  _animation() {
    if (!_ctrl.isAnimating) {
      var _random = Random().nextDouble();
      _angle = 20 + Random().nextInt(5) + _random;
      _ctrl.forward(from: 0.0).then((_) {
        _current = (_current + _random);
        _current = _current - _current ~/ 1;
        _ctrl.reset();
      });
    }
  }

  int _calIndex(value) {
    var _base = (2 * pi / _items.length / 2) / (2 * pi);
    return (((_base + value) % 1) * _items.length).floor();
  }

  _buildResult(_value) {
    var _index = _calIndex(_value * _angle + _current);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(_items[_index].title),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
