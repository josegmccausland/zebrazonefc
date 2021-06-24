import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAwayTable extends StatelessWidget {
  final hPlayed, hWin, hLosse, hDraw;
  final aPlayed, aWin, aLosse, aDraw;
  const HomeAwayTable({
    Key key,
    @required this.hPlayed,
    @required this.hWin,
    @required this.hLosse,
    @required this.hDraw,
    @required this.aPlayed,
    @required this.aWin,
    @required this.aLosse,
    @required this.aDraw,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: FittedBox(
        child: DataTable(
          dividerThickness: 0.0,

          // columnSpacing: 25,
          columns: [
            DataColumn(
                label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Text('Overview',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
            )),
     
            DataColumn(
                label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Text('',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
            )),
            DataColumn(
                label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Text('P',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
            )),
            DataColumn(
                label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Text('W',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
            )),
            DataColumn(
                label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Text('D',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
            )),
            DataColumn(
              label: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Text('L',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
          rows: [
            rowsForHomeAndAway('Home', hPlayed, hWin, hLosse, hDraw),
            rowsForHomeAndAway('Away', aPlayed, aWin, aLosse, aDraw),
          ],
        ),
      ),
    );
  }

  DataRow rowsForHomeAndAway(title, p, w, l, d) {
    return DataRow(
      cells: [
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
          child: Text(
            '$title',
            textAlign: TextAlign.right,
            style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      DataCell(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
          child: Text(''))),
      
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
          child: Text(
            '$p',
            textAlign: TextAlign.right,
            style: GoogleFonts.montserrat(),
          ),
        ),
      ),
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
          child: Text(
            '$w',
            textAlign: TextAlign.right,
            style: GoogleFonts.montserrat(),
          ),
        ),
      ),
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
          child: Text(
            '$d',
            textAlign: TextAlign.right,
            style: GoogleFonts.montserrat(),
          ),
        ),
      ),
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
          child: Text(
            '$l',
            textAlign: TextAlign.right,
            style: GoogleFonts.montserrat(),
          ),
        ),
      ),
    ]);
  }
}
