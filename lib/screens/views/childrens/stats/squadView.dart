import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zebrazone/riverpod/riverpod.dart';
import 'package:zebrazone/widgets/widgets.dart';

class SquadView extends ConsumerWidget {
  const SquadView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final squad = watch(footballTeamPlayersProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: squad.map(
          data: (data) {
            return ListView.builder(
              itemCount: data.value.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: callImage('https://zoneimages.buckthorndev.repl.co/api/v1/images/players/${data.value[index].id}'),
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
                    data.value[index].name,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text(
                    data.value[index].role.replaceAll('s', ''),
                    style: GoogleFonts.montserrat(),
                  ),
                );
              },
            );
          },
          loading: (_) => ZZLoader(),
          error: (e) => Center(
            child: ZebraError(
              title: 'Whoops!!',
              subtitle: '${e.error}'.replaceAll('Exception:', ''),
              path: 'assets/images/2.png',
              onTap: () {
                context.refresh(footballTableProvider);
              },
            ),
          ),
        ),
      ),
    );
  }
}
