import 'package:flutter/material.dart';

import 'page_arguments.dart';

/// A route builder and settings' data of the route.
class RouteBuilderSettings {
  /// The function that creates a main page.
  WidgetBuilder builder;

  /// The function that creates a sub page that is on the main page.
  WidgetBuilder subBuilder;

  /// The arguments passed to the page route.
  PageArguments arguments;

  /// Creates route builder and settings' data of the route.
  RouteBuilderSettings(
      {@required this.builder, this.subBuilder, @required this.arguments});
}

/// A generator for routes.
class RouteGenerator {
  Map<String, RouteBuilderSettings> _builderSettingsMap;

  /// Gets a route name/a route builder&settings pair of the map.
  Map<String, RouteBuilderSettings> get builderSettingsMap =>
      _builderSettingsMap;

  /// Sets a route name/a route builder&settings pair of the map.
  set builderSettingsMap(Map<String, RouteBuilderSettings> map) {
    _builderSettingsMap = map;
    _builderSettingsMap.forEach((k, v) => v.arguments.routeGenerator = this);
  }

  /// Generates initial routes for the given route name.
  List<Route<dynamic>> generateInitialRoutes(String initialRoute) {
    return <Route>[
      generateRoute(RouteSettings(
          name: initialRoute,
          arguments: builderSettingsMap[initialRoute]?.arguments))
    ];
  }

  /// Generates a route for the given route settings.
  Route<dynamic> generateRoute(RouteSettings settings) {
    var key = settings.name;
    var builderSettings = _builderSettingsMap[key];
    if (builderSettings == null) {
      key = _builderSettingsMap.keys
          .firstWhere((element) => settings.name.startsWith(element + '/'));
      if (key != null) {
        builderSettings = _builderSettingsMap[key];
      }
    }
    return builderSettings != null
        ? MaterialPageRoute(
            builder: key == settings.name || builderSettings.subBuilder == null
                ? builderSettings.builder
                : builderSettings.subBuilder,
            settings: RouteSettings(
                name: settings.name, arguments: builderSettings.arguments))
        : MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}'))));
  }
}
