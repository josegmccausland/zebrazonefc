import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zebrazone/helper/imageLogo.dart';

class PointTable extends StatelessWidget {
  final data;
  final bool whatTable;
  const PointTable({
    Key key,
    @required this.data,
    this.whatTable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SingleChildScrollView(
                  child: DataTable(
              columnSpacing: 10,
              columns: [
          DataColumn(
              label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Text('#',
                textAlign: TextAlign.right, style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold
                )),
          )),
          DataColumn(
              label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Text('Team',
                textAlign: TextAlign.right, style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold
                )),
          )),
          DataColumn(
              label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Text('P',
                textAlign: TextAlign.right, style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold
                )),
          )),
          DataColumn(
              label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Text('W',
                textAlign: TextAlign.right, style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold
                )),
          )),
           DataColumn(
              label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Text('D',
                textAlign: TextAlign.right, style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold
                )),
          )),
          DataColumn(
              label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Text('L',
                textAlign: TextAlign.right, style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold
                )),
          )),
          DataColumn(
              label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Text('PTS',
                textAlign: TextAlign.right, style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold
                )),
          )),
              ],
              rows: _tableChildren(data, whatTable),
            ),
        ),
      ],
    );
  }

  _tableChildren(data, val) {
    List<DataRow> result = [];
    if (val == false) {
      for (int i = 0; i < data.length; i++) {
        result.add((DataRow(
          cells: [
            DataCell(
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                  child: Text('${i + 1}',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.montserrat())),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: ImageLogoText(teamName: '${data[i]['team']}')
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: Text(
                  '${data[i]['gamePlayed']}',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(),
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: Text(
                  '${data[i]['win']}',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(),
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: Text(
                  '${data[i]['draw']}',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(),
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: Text(
                  '${data[i]['loss']}',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(),
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: Text(
                  '${data[i]['points']}',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        )),);
      }
      return result;
    } else {
        for (int i = 0; i < data.length; i++) {
        result.add((DataRow(
          cells: [
            DataCell(
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                  child: Text('${i + 1}',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.montserrat())),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: ImageLogoText(teamName: '${data[i]['name']}')
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: Text(
                  '${data[i]['played']}',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(),
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: Text(
                  '${data[i]['win']}',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(),
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: Text(
                  '${data[i]['draw']}',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(),
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: Text(
                  '${data[i]['loss']}',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(),
                ),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                child: Text(
                  '${data[i]['total']}',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        )),);
      }
      return result;
    }
  }
}
