import 'package:flutter_board/flutter_board.dart';
import 'package:test/test.dart';

import 'test_asset_bundle.dart';

void main() {
  group('PageArguments Tests', () {
    test('The parameters should be set', () async {
      var routeGenerator = RouteGenerator();
      var boardContext = await BoardContext.get(assetBundle: TestAssetBundle());
      var arguments = PageArguments(
          routeGenerator: routeGenerator, boardContext: boardContext);
      expect(arguments.routeGenerator, routeGenerator);
      expect(arguments.boardContext, boardContext);
    });
  });
}
