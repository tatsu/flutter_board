import 'package:flutter_board/flutter_board.dart';
import 'package:test/test.dart';

import 'test_asset_bundle.dart';

void main() {
  group('BoardConfig Tests', () {
    test('Config data be retrieved', () async {
      var config = await BoardConfig.get(assetBundle: TestAssetBundle());
      expect(config['name'], 'Flutterboard');
    });
  });
}
