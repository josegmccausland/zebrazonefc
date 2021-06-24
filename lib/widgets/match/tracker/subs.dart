import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MAtchTarackerSubs extends StatelessWidget {
  final event;
  const MAtchTarackerSubs({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: event['isHome'] == true
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: event['isHome'] == true
              ? [
                  Text(
                    '${event['time']}',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  SizedBox(width: 5),
                  Image(
                      image: AssetImage(
                        'assets/images/substitution.png',
                      ),
                      height: 20),
                  SizedBox(width: 5),
                  gameColumn(event['swap'])
                ]
              : [
                  gameColumn(event['swap']),
                  SizedBox(width: 5),
                  Image(
                      image: AssetImage(
                        'assets/images/substitution.png',
                      ),
                      height: 20),
                  SizedBox(width: 5),
                  Text(
                    '${event['time']}',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                ],
        ),
      ),
    );
  }

  Widget gameColumn(player) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${player[0]['name']}',
          style: GoogleFonts.montserrat(color: Colors.green),
        ),
        SizedBox(height: 3),
        Text(
          '${player[1]['name']}',
          style: GoogleFonts.montserrat(color: Colors.redAccent),
        )
      ],
    );
  }
}
