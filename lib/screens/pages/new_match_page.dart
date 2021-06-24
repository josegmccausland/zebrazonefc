import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zebrazone/models/tabbar_helper.dart';
import 'package:zebrazone/widgets/widgets.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class NewMatchPage extends StatefulWidget {
  final String homeTeam, awayTeam;
  final WebSocketChannel channel;

  NewMatchPage({Key key, @required this.channel, this.homeTeam, this.awayTeam}) : super(key: key);

  @override
  _NewMatchPageState createState() => _NewMatchPageState();
}

class _NewMatchPageState extends State<NewMatchPage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  TabController _tabController;
  bool silverCollapsed = false;
  var myTitle = '';
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 3);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 100 &&
          !_scrollController.position.outOfRange) {
        if (!silverCollapsed) {
          silverCollapsed = true;
          myTitle = '${widget.homeTeam.substring(0,3)} vs ${widget.awayTeam.substring(0,3)}';
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.channel.stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          var data = jsonDecode(snapshot.data);
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
                          map: data,
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
                                  'TRACKER',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'STATS',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'LINEUP',
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
                  Center(
                    child: Text('Tracker'),
                  ),
                  Center(
                    child: Text('Stats'),
                  ),
                  Center(
                    child: Text('Lineup'),
                  )
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
              body: Center(child: Text('Bruh error')));
        } else {
          return Scaffold(body: ZZLoader());
        }
      },
    );
  }
}