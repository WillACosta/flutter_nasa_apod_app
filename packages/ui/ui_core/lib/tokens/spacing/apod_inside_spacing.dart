import 'package:flutter/widgets.dart';

abstract class ApodInsideSpacing {
  /// from all sides 16
  static const EdgeInsets xs = EdgeInsets.all(16);

  /// from all sides 24
  static const EdgeInsets sm = EdgeInsets.all(24);

  /// from TLR: 20 4 4
  static const md = EdgeInsets.only(top: 20, left: 4, right: 4);

  /// from all sides 40
  static const EdgeInsets lg = EdgeInsets.all(40);

  static const EdgeInsets xl = EdgeInsets.symmetric(vertical: 20, horizontal: 25);
}
