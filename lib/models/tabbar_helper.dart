import 'package:flutter/material.dart';

class TabBarHelper extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  TabBarHelper(this._tabBar);
  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Color(0xff2E3E4B),
      child: Center(child: _tabBar),
    );
  }

  @override
  bool shouldRebuild(TabBarHelper oldDelgate) {
    return false;
  }
}
