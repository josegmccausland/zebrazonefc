import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class ZZLoader extends StatelessWidget {
  const ZZLoader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Center(
          child: SpinKitWave(
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}