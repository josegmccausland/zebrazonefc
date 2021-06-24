import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'logoGiver.dart';

class ImageLogoText extends StatelessWidget {
  final String teamName;
  const ImageLogoText({Key key, this.teamName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  getLogo(teamName),
                ),
                fit: BoxFit.contain),
          ),
        ),
        SizedBox(width: 5),
        Text(
          cleanWord(teamName.toUpperCase()),
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  String cleanWord(String text) {
    if (text.toLowerCase() == 'parma calcio 1913') {
      return 'PARMA';
    }
    return text;
  }
}
