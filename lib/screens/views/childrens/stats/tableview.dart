import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:zebrazone/riverpod/riverpod.dart';
import 'package:zebrazone/widgets/widgets.dart';

class TableView extends StatefulWidget {
  final data;
  TableView({Key key, this.data}) : super(key: key);

  @override
  _TableViewState createState() => _TableViewState();
}

class _TableViewState extends State<TableView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(length: 2, vsync: this, initialIndex: _currentIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer(
        builder: (context, watch, child) {
          final serieA = watch(footballTableProvider);
          return serieA.map(
            data: (data) {
              return PointTableV2(
                data: data.value,
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
        },
      ),
    );
  }
}

//   body: new Column(
//       children: [
//         new Padding(
//   padding: const EdgeInsets.symmetric(vertical: 20),
//   child: Container(
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         FlatButton(
//           color: _currentIndex == 0 ? Colors.black87 : Colors.white,
//           onPressed: () {
//             _tabController.animateTo(0);
//             setState(() {
//               _currentIndex = 0;
//             });
//           },
//           child: Text(
//             'SERIE A',
//             style: TextStyle(
//               color: _currentIndex == 0
//                   ? Colors.white
//                   : Colors.black87,
//             ),
//           ),
//         ),
//         FlatButton(
//           color: _currentIndex == 1 ? Colors.black87 : Colors.white,
//           onPressed: () {
//             _tabController.animateTo(1);
//             setState(() {
//               _currentIndex = 1;
//             });
//           },
//           child: Text(
//             'UCL',
//             style: TextStyle(
//               color: _currentIndex == 1
//                   ? Colors.white
//                   : Colors.black87,
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
//         ),
//         Expanded(
//           child: TabBarView(
//     controller: _tabController,
//     physics: NeverScrollableScrollPhysics(),
//     children: [
//       PointTable(
//           data: widget.data['serieA'],
//           whatTable: true,
//       ),
//       PointTable(data: widget.data['ucl']),
//     ],
//   ),
//         )
//       ],
//     )
// );
