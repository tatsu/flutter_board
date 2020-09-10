import 'package:flutter/material.dart';

import 'page_arguments.dart';

class RouteBuilderSettings {
  RouteBuilderSettings(this.builder, this.arguments);

  WidgetBuilder builder;
  PageArguments arguments;
}

class RouteGenerator {
  RouteGenerator();

  Map<String, RouteBuilderSettings> _builderSettingsMap;

  Map<String, RouteBuilderSettings> get builderSettingsMap =>
      _builderSettingsMap;

  set builderSettingsMap(Map<String, RouteBuilderSettings> map) {
    _builderSettingsMap = map;
    _builderSettingsMap.forEach((k, v) => v.arguments.routeGenerator = this);
  }

  Route<dynamic> call(RouteSettings settings) {
    var builderSettings = _builderSettingsMap[settings.name];
    return builderSettings != null
        ? MaterialPageRoute(
            builder: builderSettings.builder,
            settings: RouteSettings(
                name: settings.name, arguments: builderSettings.arguments))
        : MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}'))));
  }
}
