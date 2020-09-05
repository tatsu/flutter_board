import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';

import 'config.dart';

class PageArguments {
  PageArguments({this.title, this.icon, this.routeGenerator, this.config});

  String title;
  Widget icon;
  RouteGenerator routeGenerator;
  Config config;
}
