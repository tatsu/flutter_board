import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_asset_bundle.dart';

extension RouteWidgetTester on WidgetTester {
  Future<void> routeWidget({
    String name,
    Object arguments,
    @required Widget child,
    RouteFactory onGenerateRoute,
  }) async {
    final key = GlobalKey<NavigatorState>();
    await pumpWidget(
      MaterialApp(
        navigatorKey: key,
        home: DefaultAssetBundle(
          bundle: TestAssetBundle(),
          child: FlatButton(
            onPressed: () => key.currentState.push(
              MaterialPageRoute<void>(
                settings: RouteSettings(name: name, arguments: arguments),
                builder: (_) => child,
              ),
            ),
            child: const SizedBox(),
          ),
        ),
        onGenerateRoute: onGenerateRoute,
      ),
    );

    await tap(find.byType(FlatButton));
    await pumpAndSettle(); // Might need to be removed when testing infinite animations
  }
}
