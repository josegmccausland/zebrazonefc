import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zebrazone/helper/teamFinder.dart';
import 'package:zebrazone/models/fixtureModel.dart';

class FixtureCard extends StatelessWidget {
  final FixtureModel data;
  const FixtureCard({Key key, @required this.data}) : super(key: key);

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
                    padding: const EdgeInsets.only(top:5,left:10),
                    child: Container(
                      child: Text(
                        data.lnameArr[1].replaceAll(" | ", ''),
                    style: GoogleFonts.montserrat(
                      color: Colors.black54,
                      fontSize: 10
                    ),
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
                  matchstatus(data),
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

  Widget _buildMatchRow(val, teamName, id, FixtureModel data) {
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
            score(data, val),
            style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  String score(FixtureModel data, value) {
    if (data.status.finished == true && data.status.cancelled == true) {
      return '';
    } else if (data.status.finished == true && data.status.cancelled == false) {
      return data.status.scoreStr.split(" - ")[value];
    } else {
      return '';
    }
  }

  String matchstatus(FixtureModel data) {
    if (data.status.finished == true && data.status.finished == true) {
      return data.status.reason.short;
    } else if (data.status.finished == false && data.status.finished == true) {
      return data.status.reason.short;
    } else if (data.status.finished == true && data.status.finished == false) {
      return data.status.reason.short;
    } else {
      return '${data.status.startDateStr}\n${data.monthYearKey.substring(0, 3)}';
    }
  }
}
