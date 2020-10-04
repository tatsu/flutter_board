import 'package:flutter_board/flutter_board.dart';
import 'package:test/test.dart';

import 'test_asset_bundle.dart';

void main() {
  group('BoardContext Tests', () {
    test('Fields should be instantiated', () async {
      var context = await BoardContext.get(assetBundle: TestAssetBundle());
      expect(context.config != null, true);
      expect(context.assets != null, true);
    });
  });
}
