import 'package:flutter/material.dart';
import 'package:zebrazone/widgets/match/widgets/stats_widget.dart';

class MatchStats extends StatefulWidget {
  final stats;
  MatchStats({Key key, @required this.stats}) : super(key: key);

  @override
  _MatchStatsState createState() => _MatchStatsState();
}

class _MatchStatsState extends State<MatchStats> {
  @override
  Widget build(BuildContext context) {
    return widget.stats.length == 0 ? Center(
    ) :ListView.builder(
      itemCount: widget.stats.length,
      itemBuilder: (context, index) {
        var data = widget.stats[index];
        return StatsCard(data: data);
      },
    );
  }
}
