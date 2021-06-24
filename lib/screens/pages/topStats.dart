import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zebrazone/riverpod/riverpod.dart';
import 'package:zebrazone/widgets/widgets.dart';

class TopStats extends ConsumerWidget {
  const TopStats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final stats = watch(allStatsProvider);
    final drpbtn = watch(changeValueStatsProvider);
    List<String> keys = [
      'goal',
      'assist',
      'ontarget',
      'dribbles',
      'kpasses',
      'bigchance',
      'accuratePass',
      'cleanSheet',
      'tackle',
      'yellow',
      'red',
    ];
    List<String> menuItems = [
      'Goals',
      'Assists',
      'Shots on target',
      'Successful dribbles',
      'Key passes',
      'Big chance created',
      'Accurate passes',
      'Clean sheet',
      'Tackles succeeded',
      'Yellow cards',
      'Red cards',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Top stats',
            style: GoogleFonts.montserrat(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: stats.map(
        data: (data) {
          final value = data.value;
          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                DropdownButton<String>(
                  isExpanded: true,
                  value: menuItems[keys.indexOf(drpbtn.type)],
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.black45,
                  ),
                  onChanged: (String data) {
                    drpbtn.changeType(keys[menuItems.indexOf(data)]);
                  },
                  items:
                      menuItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Expanded(
                  child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: value[drpbtn.type].length,
                    itemBuilder: (context, index) {
                      var player = value[drpbtn.type][index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: callImage('https://zoneimages.buckthorndev.repl.co/api/v1/images/players/${player.particiantId}'),
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
                        title: Text(
                          player.participantName,
                          style: GoogleFonts.montserrat(),
                        ),
                        trailing: Text(
                          '${player.statValue}',
                          style: GoogleFonts.montserrat(
                            fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        loading: (_) => ZZLoader(),
        error: (e) => Center(child: Text(e.toString())),
      ),
    );
  }
}
