import 'package:flutter/material.dart';

import 'page_arguments.dart';

class MenuPageArguments extends PageArguments {
  String title;
  Widget icon;

  MenuPageArguments(
      {@required this.title, @required this.icon, routeGenerator, boardContext})
      : super(routeGenerator: routeGenerator, boardContext: boardContext);
}
