import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zebrazone/riverpod/riverpod.dart';
import 'package:zebrazone/screens/pages/topStats.dart';
import 'package:zebrazone/widgets/widgets.dart';

class OverView extends ConsumerWidget {
  const OverView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final stats = watch(allStatsProvider);
    final overview = watch(overViewDataProvider);
    return Scaffold(
      body: ListView(
        children: [
          overview.map(
            data: (data) {
              // print(data.value['upcoming'][0]);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Next game',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: UpcomingGameCard(
                      data: data.value['upcoming'][0],
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Form',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  FormTile(
                    colorlist: _createForm(
                      data.value['last5games'],
                    ),
                  )
                ],
              );
            },
            loading: (_) => Container(),
            error: (e) => Container(),
          ),
          SizedBox(height: 5),
          stats.map(
            data: (data) {
              final val = data.value;
              var listtileGoals = [
                val['goal'][0],
                val['goal'][1],
                val['goal'][2],
                val['goal'][3],
              ];
              var listtileAssists = [
                val['assist'][0],
                val['assist'][1],
                val['assist'][2],
                val['assist'][3],
              ];
              var listtileYellows = [
                val['yellow'][0],
                val['yellow'][1],
                val['yellow'][2],
                val['yellow'][3],
              ];
              // needs to use loop to avoid error
              var listtileReds = [
                val['red'][0],
                val['red'][1],
                val['red'][2],
                val['red'][3],
              ];
              // print(listtile);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top stats',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => TopStats(),
                              ),
                            );
                          },
                          child: Text(
                            'View more',
                            style: GoogleFonts.montserrat(
                              color: Colors.blue,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                    child: Text(
                      'Goals',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.green
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: listtileGoals.length,
                      itemBuilder: (context, index) {
                        return PlayerTile(
                          data: listtileGoals[index],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                    child: Text(
                      'Assists',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: listtileAssists.length,
                      itemBuilder: (context, index) {
                        return PlayerTile(
                          data: listtileAssists[index],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                    child: Text(
                      'Yellow Cards',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.green
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: listtileAssists.length,
                      itemBuilder: (context, index) {
                        return PlayerTile(
                          // heading: "Assists",
                          data: listtileYellows[index],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                    child: Text(
                      'Red Cards',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.green
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: listtileAssists.length,
                      itemBuilder: (context, index) {
                        return PlayerTile(
                          // heading: "Assists",
                          data: listtileReds[index],
                        );
                      },
                    ),
                  ),
                ],
              );
              // return Container();
            },
            loading: (_) => ZZLoader(),
            error: (e) => Center(child: Text(e.toString())),
          ),
        ],
      ),
    );
  }

  _createForm(form) {
    List<Widget> result = [];
    for (int i = 0; i < form.length; i++) {
      result.add(FormIndicator(letter: form[i]['result']));
    }
    return result;
  }
}

// stats.map(
//         data: (data) {
//           var goal = data.value['goal'];
//           return ListView.builder(
//               itemCount: goal.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(goal[index].participantName),
//                 );
//               });
//         },
//
//       ),
