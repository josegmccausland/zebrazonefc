import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zebrazone/models/tabbar_helper.dart';
import 'package:zebrazone/widgets/widgets.dart';

class OldMatchPage extends StatefulWidget {
  final String url, homeTeam, awayTeam;

  OldMatchPage({Key key, @required this.url, this.homeTeam, this.awayTeam})
      : super(key: key);

  @override
  _OldMatchPageState createState() => _OldMatchPageState();
}

class _OldMatchPageState extends State<OldMatchPage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  TabController _tabController;
  bool silverCollapsed = false;
  var myTitle = '';
  Future oldGame;
  @override
  void initState() {
    super.initState();
    oldGame = fetchData(widget.url);
    _tabController = TabController(vsync: this, initialIndex: 0, length: 3);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 100 &&
          !_scrollController.position.outOfRange) {
        if (!silverCollapsed) {
          silverCollapsed = true;
          myTitle =
              '${widget.homeTeam.substring(0, 3)} vs ${widget.awayTeam.substring(0, 3)}';
          setState(() {});
        }
      }

      if (_scrollController.offset <= 100 &&
          !_scrollController.position.outOfRange) {
        if (silverCollapsed) {
          silverCollapsed = false;
          myTitle = '';
          setState(() {});
        }
      }
    });
  }

  Future fetchData(url) async {
    final response = await http.get(url);
    var data = jsonDecode(response.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: oldGame,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data['content']['stats']['stats']);
          return Scaffold(
            body: DefaultTabController(
              length: 3,
              child: NestedScrollView(
                controller: _scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 110,
                      floating: true,
                      elevation: 0,
                      pinned: true,
                      backgroundColor: Color(0xff2E3E4B),
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text(myTitle),
                        collapseMode: CollapseMode.parallax,
                        background: MatchHeader(
                          map: snapshot.data,
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: TabBarHelper(
                        TabBar(
                            isScrollable: true,
                            indicatorColor: Colors.white,
                            controller: _tabController,
                            tabs: <Widget>[
                              Tab(
                                child: Text(
                                  'Tracker',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Stats',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Lineup',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ]),
                      ),
                    )
                  ];
                },
                body: TabBarView(controller: _tabController, children: [
                  MatchTracker(
                      data: snapshot.data['content']['matchFacts']['events']['events']),
                  MatchStats(
                    stats:snapshot.data['content']['stats'] == null ? [] : snapshot.data['content']['stats']['stats'],
                  ), 
                  MatchLineup(
                    data: snapshot.data['content']['lineup'],
                  ),
                ]),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
            ),
            body: Center(
              child: Text('Bruh error'),
            ),
          );
        } else {
          return Scaffold(
            body: ZZLoader(),
          );
        }
      },
    );
  }
}
