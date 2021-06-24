import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerRow extends StatelessWidget {
  final String name, imgUrl;
  const PlayerRow({Key key, this.name, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.fitWidth,
                  alignment: FractionalOffset.topCenter),
            ),
          ),
          // SizedBox(width:20),
          Expanded(
            child: Container(
              child: Text(
                name.toUpperCase(),
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
