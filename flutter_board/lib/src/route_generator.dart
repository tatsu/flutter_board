import 'package:flutter/material.dart';

class RouteBuilderSettings {
  RouteBuilderSettings(this.builder, this.arguments);

  WidgetBuilder builder;
  Object arguments;
}

class RouteGenerator {
  RouteGenerator({this.builderSettingsMap});

  Map<String, RouteBuilderSettings> builderSettingsMap;

  Route<dynamic> call(RouteSettings settings) {
    var builderSettings = builderSettingsMap[settings.name];
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
