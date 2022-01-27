import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  void push(Widget widget) {
    Navigator.of(this).push(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ));
  }
}
