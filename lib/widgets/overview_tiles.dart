import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget overViewTextTile({@required String title, @required String subtitle}) {
  return Expanded(
    child: Card(
          child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.montserrat(),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget overViewChart({@required title, @required indicator, @required data}) {
  return Card(
    elevation: 4,
      child: Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(1.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 15.0,
                  color: Color(0xff505050),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            child: PieChart(
                PieChartData(
                    centerSpaceRadius: 40,
                    sections: data,
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 0),
              ),
          ),
          Padding(
            padding: EdgeInsets.all(1.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: indicator,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    ),
  );
}

// [{Matches: {total: 7, percentage: -, home: 4, homePercentage: 57.14%, away: 3, awayPercentage: 42.86%}}, {Wins: {total: 3, percentage: 42.86%, home: 2, homePercentage: 50.00%, away: 1, awayPercentage: 33.33%}}, {Draws: {total: 3, percentage: 42.86%, home: 1, homePercentage: 25.00%, away: 2, awayPercentage: 66.67%}}, {Lost: {total: 1, percentage: 14.29%, home: 1, homePercentage: 25.00%, away: 0, awayPercentage: 0.00%}}, {Scored goals: {total: 12, percentage: 1.71/per game, home: 7, homePercentage: 1.75/per game, away: 5, awayPercentage: 1.25/per game}}, {Goals against: {total: 6, percentage: 0.86/per game, home: 3, homePercentage: 1/per game, away: 3, awayPercentage: 1/per game}}, {Clean sheet: {total: 3, percentage: 43%, home: 2, homePercentage: 50%, away: 1, awayPercentage: 33%}}, {Avg minute scoring a goal: {total: 58', percentage: -, home: 64', homePercentage: -, away: 53', awayPercentage: -}}, {Avg minute lose a goal: {total: 52', percentage: -, home: 55', homePercentage: -, away: 29', awayPercentage: -}}]
