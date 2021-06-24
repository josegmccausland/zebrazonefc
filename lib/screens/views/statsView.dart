import 'package:flutter/material.dart';

import 'childrens/children.dart';

class StatsView extends StatefulWidget {
  const StatsView({Key key}) : super(key: key);

  @override
  _StatsViewState createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Colors.white,
          child: TabBar(
            unselectedLabelColor: Colors.black45,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 0.0),
            ),
            labelColor: Colors.black,
            controller: _tabController,
            tabs: [
              Tab(
                text: 'Overview',
              ),
              Tab(
                text: 'Table',
              ),
              Tab(
                text: 'Fixtures',
              ),
              Tab(
                text: 'Squad',
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          OverView(),
          TableView(),
          FixturesView(),
          SquadView()
        ],
      ),
    );
  }
}
