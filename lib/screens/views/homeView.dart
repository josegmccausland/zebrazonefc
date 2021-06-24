import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zebrazone/riverpod/riverpod.dart';
import 'package:zebrazone/widgets/widgets.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final news = watch(footballnewsProvider);
    return news.map(
      data: (data) {
        return RefreshIndicator(
          onRefresh: () => refresh(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              itemCount: data.value.length,
              itemBuilder: (BuildContext context, int index) {
                var article = data.value[index];
                return MainNewsCard(
                  data: article,
                );
              },
            ),
          ),
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

  Future<void> refresh(BuildContext context) async {
    context.refresh(footballnewsProvider);
  }
}
