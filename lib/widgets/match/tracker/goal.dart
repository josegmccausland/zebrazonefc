import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchTrackerGoal extends StatelessWidget {
  final event;

  const MatchTrackerGoal({Key key, this.event}) : super(key: key);

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
                        'assets/images/soccer-ball.png',
                      ),
                      height: 16),
                  SizedBox(width: 5),
                  Text(
                    '${event['nameStr']}',
                    style: GoogleFonts.montserrat(color: Colors.black87),
                  ),
                ]
              : [
                  Text(
                    '${event['nameStr']}',
                    style: GoogleFonts.montserrat(color: Colors.black87),
                  ),
                  SizedBox(width: 5),
                  Image(
                      image: AssetImage(
                        'assets/images/soccer-ball.png',
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
}
