import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpcomingGameCard extends StatelessWidget {
  final data;
  const UpcomingGameCard({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10),
                    child: Container(
                      child: Text(
                        data['lnameArr'][1].replaceAll(" | ", ''),
                        style: GoogleFonts.montserrat(
                            color: Colors.black54, fontSize: 10),
                      ),
                    ),
                  ),
                  _buildMatchRow(
                    0,
                    findTeam(data)['home'],
                    findTeam(data)['hId'],
                    data,
                  ),
                  _buildMatchRow(
                    1,
                    findTeam(data)['away'],
                    findTeam(data)['aId'],
                    data,
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              child: VerticalDivider(
                color: Theme.of(context).dividerColor,
                width: 5,
              ),
            ),
            Container(
              width: 80,
              child: Center(
                child: Text(
                  '${data['status']['startDateStrShort'].replaceAll('.','')}\n${data['status']['startTimeStr']}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  findTeam(map) {
    var myTeam = 'Juventus';
    var othrTeam = map['opponent']['name'];
    var gameOn = map['lnameArr'][0];
    var result = gameOn.toLowerCase() == 'h'
        ? {
            'home': myTeam,
            'hId': 9885,
            'away': othrTeam,
            'aId': map['opponent']['id'],
          }
        : {
            'away': myTeam,
            'aId': 9885,
            'hId': map['opponent']['id'],
            'home': othrTeam,
          };
    return result;
  }

  Widget _buildMatchRow(val, teamName, id, data) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
          width: 35,
          child: Image.network(
            'https://www.fotmob.com/images/team/${id}_large',
            height: 30,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace stackTrace) {
              return Image.asset('assets/images/default-team.png');
            },
          ),
        ),
        Expanded(
          child: Text(
            teamName,
            textAlign: TextAlign.start,
            style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text(
            '',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
