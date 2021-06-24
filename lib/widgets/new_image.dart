import 'package:flutter/material.dart';

ImageProvider callImage(src) {
  try {
    return NetworkImage(src);
  } catch (e) {
    return AssetImage('assets/images/default-player.png');
  }
}
