import 'package:flutter/material.dart';

import 'page_arguments.dart';

/// Arguments passed to the route of the content page which has a component
/// like a menu, e.g. [Drawer].
class MenuPageArguments extends PageArguments {
  /// The title of the content page.
  String title;

  /// The widget to display before the title.
  Widget icon;

  /// Creates arguments passed to the route of the content page which has a
  /// component like a menu.
  MenuPageArguments(
      {@required this.title, @required this.icon, routeGenerator, boardContext})
      : super(routeGenerator: routeGenerator, boardContext: boardContext);
}
