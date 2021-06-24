import 'package:flutter/material.dart';
import 'package:zebrazone/helper/logoGiver.dart';

class BuildTeam extends StatelessWidget {
  final teamName;
  const BuildTeam({Key key, this.teamName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    getLogo(teamName),
                  ),
                  fit: BoxFit.contain),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
          //   child: Text(teamName,
          //   style: GoogleFonts.montserrat(
          //     fontSize:12,
          //     color: Colors.white
          //   ),
          //   textAlign: TextAlign.center,
          //   ),
          // )
        ],
      ),
    );
  }
}
