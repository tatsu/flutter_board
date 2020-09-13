import 'package:flutter/material.dart';

import 'page_arguments.dart';

class RouteBuilderSettings {
  WidgetBuilder builder;
  WidgetBuilder subBuilder;
  PageArguments arguments;

  RouteBuilderSettings(
      {@required this.builder, this.subBuilder, @required this.arguments});
}

class RouteGenerator {
  Map<String, RouteBuilderSettings> _builderSettingsMap;

  Map<String, RouteBuilderSettings> get builderSettingsMap =>
      _builderSettingsMap;

  set builderSettingsMap(Map<String, RouteBuilderSettings> map) {
    _builderSettingsMap = map;
    _builderSettingsMap.forEach((k, v) => v.arguments.routeGenerator = this);
  }

  List<Route<dynamic>> generateInitialRoutes(String initialRoute) {
    return <Route>[
      generateRoute(RouteSettings(
          name: initialRoute,
          arguments: builderSettingsMap[initialRoute]?.arguments))
    ];
  }

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
