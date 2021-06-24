import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildBoard extends StatelessWidget {
  final status, hS, aS;
  const BuildBoard(
      {Key key, @required this.status, @required this.hS, @required this.aS})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(status,
              style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          SizedBox(height: 5),
          Text(
            '$hS - $aS',
            style: GoogleFonts.montserrat(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
