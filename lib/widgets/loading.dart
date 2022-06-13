import 'package:flutter/material.dart';
import 'text.dart';

import '/values/colors.dart' as colors;

class Loading extends StatefulWidget {
  final bool? backgroundTransparent;
  final String? message;
  final Stream<bool>? status;
  final Widget child;

  const Loading(
      {Key? key,
      this.status,
      required this.child,
      this.message,
      this.backgroundTransparent})
      : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: widget.status,
        initialData: false,
        builder: (context, snapshot) {
          return Stack(
            children: <Widget>[widget.child, _loading(snapshot.data ?? false)],
          );
        });
  }

  Widget _loading(bool loading) {
    return loading == true
        ? Container(
            alignment: Alignment.center,
            color: widget.backgroundTransparent == true
                ? Colors.transparent
                : Colors.black54,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomText(
                      text: widget.message ?? "",
                      white:
                          widget.backgroundTransparent == true ? false : true,
                    ),
                  ),
                  CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(colors.accentColor),
                  )
                ]),
          )
        : Container();
  }
}
