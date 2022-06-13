import 'package:flutter/material.dart';
import 'package:zone_store/pages/home/tab/childTab/explore.tab.dart';
import 'package:zone_store/pages/home/tab/childTab/minigame.tab.dart';
import 'package:zone_store/pages/home/tab/childTab/vouchers.tab.dart';

class FeedTab extends StatefulWidget {
  const FeedTab({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FeedTab();
}

class _FeedTab extends State<FeedTab> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  height: 50.0,
                  child: TabBar(
                    indicatorColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.blue,
                    tabs: [
                      Tab(
                        text: "Explore",
                      ),
                      Tab(
                        text: "Mini Game",
                      ),
                      Tab(
                        text: "Vouchers",
                      ),
                    ],
                  ),
                ),
              ),
              body: TabBarView(children: <Widget>[
                ExploreTab(),
                MiniGameTab(),
                VouchersTab()
              ]),
            )));
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }
}
