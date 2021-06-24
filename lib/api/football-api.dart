

// abstract class FootballApiRepository {
//   Future<List> footballApi();
// }

// class FootballApiImplement extends FootballApiRepository {
//   @override
//   Future<List> footballApi() async {
//     // var cors = 'https://cors-anywhere.herokuapp.com/';

//     // var timeZoneUrl = 'http://ip-api.com/json';
//     // final timeZoneResponse = await http.get(timeZoneUrl);
//     // var timeZone = jsonDecode(timeZoneResponse.body);

//     // var tableUrl =
//     //     'https://www.thesportsdb.com/api/v1/json/1/lookuptable.php?l=4332&s=2020-2021';

//     // var squadUrl = '$cors/https://zebrazonefc.com/squad.json';

//     // var zzstatsUrl = '$cors/https://zebrazonefc.com/stats.json';

//     // var zzfcDUrl = '$cors/https://zebrazonefc.com/urls.json';

//     // var fotmobUrl =
//     //     '$cors/https://www.fotmob.com/teams?id=9885&tab=fixtures&type=team&timeZone=${timeZone['timezone']}';

//     // var result = [];
//     // var stats = [], fixture = [];
//     // var fotmobResponse = await http.get(fotmobUrl);
//     // final serieAtable = await http.get(tableUrl);
//     // final squadResponse = await http.get(squadUrl);
//     // final zzstatsRespnse = await http.get(zzstatsUrl);
//     // final zzfcDRespnse = await http.get(zzfcDUrl);
//     // var fotFixtures = jsonDecode(fotmobResponse.body);
//     // var converttable = jsonDecode(serieAtable.body);
//     // var convertsquad = jsonDecode(squadResponse.body);
//     // var convertzzstats = jsonDecode(zzstatsRespnse.body);
//     // var convertzzfcD = jsonDecode(zzfcDRespnse.body);
//     // var fixturesMap = fotFixtures['fixturesTab']['fixtures'];
//     // var keysList = fixturesMap.keys.toList();
//     // // fixtures
//     // for (int i = 0; i < keysList.length; i++) {
//     //   var key = keysList[i];
//     //   var fixData = fixturesMap[key];
//     //   for (int j = 0; j < fixData.length; j++) {
//     //     fixture.add(fixData[j]);
//     //   }
//     // }

//     // var form = [], uclTable = [];

//     // result.add(
//     //   {
//     //     'stats': stats,
//     //     'more': [
//     //       {'form': form},
//     //       {'more': convertzzstats}
//     //     ]
//     //   },
//     // );
//     // result.add({'fixtures': fixture, 'stats': convertzzfcD['stats']});
//     // result.add(
//     //   {
//     //     'table': {'serieA': converttable['table'], 'ucl': uclTable},
//     //   },
//     // );

//     // result.add(convertsquad);

//     // return result;
//     return [];
//   }
// }
