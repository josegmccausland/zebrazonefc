import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchLineup extends StatefulWidget {
  final data;
  MatchLineup({Key key, this.data}) : super(key: key);

  @override
  _MatchLineupState createState() => _MatchLineupState();
}

class _MatchLineupState extends State<MatchLineup> {
  createAccurateLineup({data, isTrue = true}) {
    List res = [];
    for (int i = 0; i < data.length; i++) {
      for (int j = 0; j < data[i].length; j++) {
        res.add(data[i][j]);
      }
    }
    return isTrue ? res : res.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Center(
                    child: Text('${widget.data['lineup'][0]['lineup']}',
                        style: GoogleFonts.montserrat())),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Center(
                  child: Text(
                    '${widget.data['lineup'][1]['lineup']}',
                    style: GoogleFonts.montserrat(),
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: buildLineup(context,widget.data['lineup'][0]['players'],true),
              ),
            ),
            Expanded(
              flex: 5,
              child: buildLineup(context,widget.data['lineup'][1]['players'],false),
            ),
          ],
        )
      ],
    );
  }

  Widget buildLineup(context, players, homeTeam) {
    var teamData = createAccurateLineup(data: players, isTrue: homeTeam);
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: teamData.length,
      separatorBuilder: (context, index) {
        return Divider(height: 8.0);
      },
      itemBuilder: (context, index) {
        // imageUrl shirt
        return Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:  Text(
          '${teamData[index]['shirt']} ${teamData[index]['name']}',
          style: GoogleFonts.roboto(color: Colors.black87),
          textAlign: TextAlign.start,
        )
          ),
        );
      },
    );
  }
}
