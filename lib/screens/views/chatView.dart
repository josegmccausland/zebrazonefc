import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  ChatView({Key key}) : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
                text: '#general',
              ),
              Tab(
                text: '#transfer',
              ),
              Tab(
                text: '#prediction',
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text(
              'General',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          Center(
            child: Text(
              'Transfer',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          Center(
            child: Text(
              'Prediction',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
