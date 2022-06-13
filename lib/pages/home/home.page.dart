import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone_store/blocs/home.bloc.dart';
import 'package:zone_store/pages/home/tab/feed.tab.dart';
import 'package:zone_store/pages/home/tab/profile.tab.dart';
import 'package:zone_store/pages/home/tab/home.tab.dart';
import 'package:zone_store/widgets/loading.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<HomeBloc>(context);
    bloc.setLoading(isLoading: false);
  }

  @override
  Widget build(BuildContext context) {
    return Loading(
        message: bloc.loadingMess,
        status: bloc.loading,
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home, size: 24)),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_on_square, size: 24)),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled, size: 24)),
          ]),
          tabBuilder: (context, int index) {
            late final CupertinoTabView returnValue;
            switch (index) {
              case 0:
                returnValue = CupertinoTabView(builder: (context) {
                  return const CupertinoPageScaffold(
                    child: ProductListTab(),
                  );
                });
                break;
              case 1:
                returnValue = CupertinoTabView(builder: (context) {
                  return const CupertinoPageScaffold(
                    child: FeedTab(),
                  );
                });
                break;
              case 2:
                returnValue = CupertinoTabView(builder: (context) {
                  return const CupertinoPageScaffold(
                    child: CartTab(),
                  );
                });
                break;
            }
            return returnValue;
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}
