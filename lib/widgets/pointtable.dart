import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:zebrazone/helper/imageLogo.dart';
import 'package:zebrazone/models/tableMobel.dart';

class PointTableV2 extends StatelessWidget {
  final data;
  const PointTableV2({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildPositions(context, data),
        ],
      ),
    );
  }

  buildPositions(BuildContext context, List<TableModel> data) {
    List<TableRow> rows = [];
    rows.add(buildTableHead(context));
    for (int i = 0; i < data.length; i++) {
      var position = data[i];
      rows.add(
        TableRow(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
          children: [
            TableCell(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 2, vertical: 8.0),
                child: Text(
                  position.idx.toString(),
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 2, vertical: 8.0),
                child: Image.network(
                  'https://www.fotmob.com/images/team/${position.id}_large',
                  height: 15,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 2, vertical: 8.0),
                child: Text(
                  position.name,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  )
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
                child: Text(
                  position.played.toString(),
                   style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  // textAlign: TextAlign.right,
                ),
              ),
            ),
            TableCell(
              child: Padding(
                            padding: const EdgeInsets.all(8.0),

                child: Text(
                  '${position.wins}-${position.draws}-${position.losses}',
                   style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),

                child: Text(
                  position.pts.toString(),
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: {
            0: IntrinsicColumnWidth(),
            1: IntrinsicColumnWidth(),
            2: IntrinsicColumnWidth(),
            3: IntrinsicColumnWidth(),
            4: IntrinsicColumnWidth(),
            5: IntrinsicColumnWidth()
          },
          children: rows),
    );
  }

  TableRow buildTableHead(context) {
    return TableRow(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black),
        ),
      ),
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
            child: Text(
              '#',
              textAlign: TextAlign.right,
             style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
            child: Text(
              'Team',
              style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
            child: Text(
              'Pl',
              style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
            child: Text(
              'W-D-L',
               style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
            child: Text(
              'Pts',
               style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}
