import 'package:flutter/material.dart';

class FormTile extends StatefulWidget {
  final colorlist;
  const FormTile({Key key, @required this.colorlist}) : super(key: key);

  @override
  _FormTileState createState() => _FormTileState();
}

class _FormTileState extends State<FormTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Card(
              child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(1.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: widget.colorlist,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
