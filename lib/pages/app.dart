import 'package:flutter/material.dart';
import 'package:zone_store/blocs/base/bloc_provider.dart';
import 'package:zone_store/pages/home/home.page.dart';
import '../values/theme.dart' as appTheme;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme.theme,
        home: HomePage(),
      ),
    );
  }
}
