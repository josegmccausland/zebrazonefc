import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:zebrazone/helper/nextGameIndex.dart';
import 'package:zebrazone/riverpod/riverpod.dart';
import 'package:zebrazone/widgets/widgets.dart';

class FixturesView extends ConsumerWidget {
  const FixturesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final fixture = watch(footballFixtureProvider);
    return fixture.map(
      data: (data) {
        // thanks to this github issue :Run: https://github.com/google/flutter.widgets/issues/187
        final ItemScrollController itemScrollController =
            ItemScrollController();
        final ItemPositionsListener itemPositionsListener =
            ItemPositionsListener.create();
        SchedulerBinding.instance.addPostFrameCallback((_) {
          var nextGame = findNextGame(data.value);
          itemScrollController.jumpTo(index: nextGame);
        });
        return ScrollablePositionedList.builder(
          itemCount: data.value.length,
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          itemBuilder: (BuildContext context, int index) {
            var fixture = data.value[index];
            return FixtureCard(data: fixture);
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
    );
  }
}
