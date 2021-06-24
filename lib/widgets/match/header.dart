import 'package:flutter/material.dart';

import 'widgets/buildTeam.dart';
import 'widgets/buildBoard.dart';

class MatchHeader extends StatelessWidget {
  final map;
  const MatchHeader({Key key, this.map}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top:34.0),
      child: Container(
        color: Color(0xff2E3E4B),
          child: Row(
        children: [
          BuildTeam(teamName: map['header']['teams'][0]['name']),
          BuildBoard(
            status: 'FT',
            hS: '${map['header']['teams'][0]['score']}',
            aS: '${map['header']['teams'][1]['score']}',
          ),
          BuildTeam(teamName:  map['header']['teams'][1]['name']),
        ],
      )),
    );
  }
}
