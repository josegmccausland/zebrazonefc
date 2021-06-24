import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchTrackerCard extends StatelessWidget {
  final event;
  const MatchTrackerCard({Key key, this.event}) : super(key: key);

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
                  cardHeader(context, event['card']),
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
                  cardHeader(context, event['card']),
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

  Widget cardHeader(BuildContext context, type) {
    if (type.toLowerCase() == 'yellow') {
      return Image(
          image: AssetImage(
            'assets/images/yellow-card.png',
          ),
          height: 20);
    } else {
      return Image(
          image: AssetImage(
            'assets/images/red-card.png',
          ),
          height: 20);
    }
  }
}
