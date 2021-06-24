import 'package:flutter/material.dart';
import 'package:zebrazone/widgets/match/tracker/subs.dart';

import 'card.dart';
import 'goal.dart';

class MatchTracker extends StatefulWidget {
  final data;
  MatchTracker({Key key, @required this.data}) : super(key: key);

  @override
  _MatchTrackerState createState() => _MatchTrackerState();
}

class _MatchTrackerState extends State<MatchTracker> {
  @override
  Widget build(BuildContext context) {
    return widget.data.length == 0 ? Center() : ListView.separated(
      itemCount: widget.data.length,
      separatorBuilder: (context, index) {
        return Divider(height: 8, color: Colors.transparent);
      },
      itemBuilder: (context, index) {
        var event = widget.data[index];
        if (event['type'].toLowerCase() == 'card') {
          return MatchTrackerCard(
            event: event,
          );
        } else if (event['type'].toLowerCase() == 'goal') {
          return MatchTrackerGoal(event: event);
        } else if (event['type'].toLowerCase() == 'substitution') {
          return MAtchTarackerSubs(event: event);
        } else {
          return Container(
            width: 0,
            height:0
          );
        }
      },
    );
  }
}
