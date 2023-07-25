import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Size get deviceSize => MediaQuery.of(this).size;

  double get deviceHeight => deviceSize.height;

  double get deviceWidth => deviceSize.width;
}
