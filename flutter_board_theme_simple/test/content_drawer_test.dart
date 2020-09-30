import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:flutter_board_theme_simple/flutter_board_theme_simple.dart';
import 'package:flutter_test/flutter_test.dart';

import 'route_widget_tester.dart';

void main() {
  group('ContentDrawer Widget Tests', () {
    final routeGenerator = RouteGenerator();
    routeGenerator.builderSettingsMap = {
      '/bar': RouteBuilderSettings(
          builder: (context) => Container(),
          subBuilder: (context) => ContentPage(subPage: true),
          arguments: MenuPageArguments(
            title: 'Bar',
            icon: Icon(Icons.delete),
          )),
    };

    testWidgets('Testing if ContentDrawer show up', (tester) async {
      await tester.routeWidget(
        onGenerateRoute: routeGenerator.generateRoute,
        name: '/foo',
        arguments: MenuPageArguments(
          title: 'foo',
          icon: Icon(Icons.add),
          routeGenerator: routeGenerator,
        ),
        child: ContentDrawer(),
      );
      expect(find.byType(ContentDrawer), findsOneWidget);
    });
  });
}
