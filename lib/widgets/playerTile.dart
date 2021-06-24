import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zebrazone/models/statsModel.dart';
import 'package:zebrazone/widgets/widgets.dart';

class PlayerTile extends StatelessWidget {
  final StatsModel data;
  const PlayerTile({Key key, @required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 15.0),
          child: Container(
            width: 130,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.01),
                  spreadRadius: 0.001,
                  blurRadius: 10,
                  offset: Offset(0, 0),
                )
              ],
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.3),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 5, right: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        child:  CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: callImage('https://zoneimages.buckthorndev.repl.co/api/v1/images/players/${data.particiantId}'),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black54,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        data.statValue.toString(),
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      data.participantName,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}