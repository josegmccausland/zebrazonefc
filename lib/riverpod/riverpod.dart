import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zebrazone/api/footballAPI.dart';
import 'package:zebrazone/api/newsAPI.dart';
import 'package:zebrazone/api/overviewAPI.dart';
import 'package:zebrazone/api/statsAPI.dart';
import 'package:zebrazone/models/models.dart';
import 'package:zebrazone/provider/topstats.dart';

/// FOOTBALL API PROVIDER
///
/// Which will help us in communicating with server
/// Better than Bloc
final footballApiProvider =
    Provider((ref) => FootballApi('https://zoneapi.buckthorndev.repl.co'));

/// Riverpod so nice bro where we can use FutureProvider instead of create 100+
/// line in flutter bloc
final footballTableProvider = FutureProvider<List<TableModel>>(
  (ref) async {
    final response = ref.read(footballApiProvider);
    return response.getSerieATable();
  },
);

///fixtureview
final footballFixtureProvider = FutureProvider<List<FixtureModel>>(
  (ref) async {
    final response = ref.read(footballApiProvider);
    return response.getJuventusFixture();
  },
);

/// squad view
final footballTeamPlayersProvider = FutureProvider<List<SquadModel>>(
  (ref) async {
    final response = ref.read(footballApiProvider);
    return response.getJuventusSquad();
  },
);

/// ZebraZoneFc.com wordpress api
/// yeah no more boring bloc :)
final zebrazoneApiProvider = Provider((ref) => News());

///Riverpod probvider for zebrazone home page
final footballnewsProvider = FutureProvider.autoDispose<List<NewsModel>>(
  (ref) async {
    final response = ref.read(zebrazoneApiProvider);
    return response.fetchZZposts();
  },
);

/// Juventus only stats provider
final juventusStatsProvider = Provider((ref) => StatsApi(
    'http://zoneapi.buckthorndev.repl.co/api/v1/buckthorn/zonefootball/zebrazone/stats'));

final allStatsProvider = FutureProvider<Map<String, List<StatsModel>>>(
  (ref) async {
    final response = ref.read(juventusStatsProvider);
    return response.getStats();
  },
);

/// Overview
final overviewProvider = Provider((ref) => OverviewApi(
    'http://zoneapi.buckthorndev.repl.co/api/v1/buckthorn/zonefootball/zebrazone'));

final overViewDataProvider = FutureProvider<Map<String, dynamic>>(
  (ref) async {
    final response = ref.read(overviewProvider);
    return response.getOverview();
  },
);

final changeValueStatsProvider = ChangeNotifierProvider(
  (ref) => ChangeTopStats(),
);
