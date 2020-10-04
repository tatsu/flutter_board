import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:test/test.dart';

void main() {
  group('RouteBuilderSettings Tests', () {
    test('The parameters should be set', () async {
      var builder = (context) => Text('main');
      var subBuilder = (context) => Text('sub');
      var arguments = MenuPageArguments(
        title: 'Home',
        icon: Icon(Icons.home),
      );
      var settings = RouteBuilderSettings(
          builder: builder, subBuilder: subBuilder, arguments: arguments);
      expect(settings.builder, builder);
      expect(settings.subBuilder, subBuilder);
      expect(settings.arguments, arguments);
    });
  });

  group('RouteGenerator Tests', () {
    final routeGenerator = RouteGenerator();
    var rootBuilder = (context) => Scaffold();
    var rootArguments = MenuPageArguments(
      title: 'Home',
      icon: Icon(Icons.home),
    );
    var docArguments = MenuPageArguments(
      title: 'Documents',
      icon: Icon(Icons.apps),
    );
    var docBuilder = (context) => Scaffold();
    routeGenerator.builderSettingsMap = {
      '/': RouteBuilderSettings(builder: rootBuilder, arguments: rootArguments),
      '/docs':
          RouteBuilderSettings(builder: docBuilder, arguments: docArguments),
    };

    test('The map should be retrieved', () {
      expect(routeGenerator.builderSettingsMap.length, 2);
      expect(
          (routeGenerator.builderSettingsMap['/'].arguments
                  as MenuPageArguments)
              .title,
          'Home');
    });
    test('The initial routes should be retrieved', () {
      var routes = routeGenerator.generateInitialRoutes('/');
      expect(routes.length, 1);
      expect((routes[0] as MaterialPageRoute).builder, rootBuilder);
      expect(routes[0].settings.name, '/');
      expect(routes[0].settings.arguments, rootArguments);
    });
    test('The route should be retrieved', () {
      var route = routeGenerator.generateRoute(RouteSettings(name: '/docs'));
      expect((route as MaterialPageRoute).builder, docBuilder);
      expect(route.settings.name, '/docs');
      expect(route.settings.arguments, docArguments);
    });
  });
}
