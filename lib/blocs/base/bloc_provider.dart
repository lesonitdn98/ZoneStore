import 'package:flutter/material.dart';
import 'package:zone_store/blocs/home.bloc.dart';
import 'package:provider/provider.dart';

class BlocProvider extends StatelessWidget {
  final Widget child;

  const BlocProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;
    return MultiProvider(
        providers: [Provider<HomeBloc>.value(value: new HomeBloc())],
        child: child);
  }
}
