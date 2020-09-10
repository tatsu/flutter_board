import 'package:flutter/material.dart';

import 'board_context.dart';
import 'route_generator.dart';

class PageArguments {
  PageArguments(
      {@required this.title,
      @required this.icon,
      this.routeGenerator,
      this.boardContext});

  String title;
  Widget icon;
  RouteGenerator routeGenerator;
  BoardContext boardContext;
}
