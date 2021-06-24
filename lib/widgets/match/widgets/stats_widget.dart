import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsCard extends StatelessWidget {
  final data;
  const StatsCard({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: fullStatsMaker(data['stats']),
      ),
    );
  }

  Widget fullStatsMaker(List val) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: val.map((e) => rowOfStats(e)).toList());
  }

  Widget rowOfStats(e) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        color: Colors.white,
        height: 40,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text(
                '${e['stats'][0]}',
                style: GoogleFonts.montserrat(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text('${e['title']}'.toUpperCase(),
                  style: GoogleFonts.montserrat(color: Colors.black54)),
            ),
            Container(
              child: Text(
                '${e['stats'][1]}',
                style: GoogleFonts.montserrat(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
