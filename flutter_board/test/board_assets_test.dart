import 'package:flutter_board/flutter_board.dart';
import 'package:test/test.dart';

import 'test_asset_bundle.dart';

void main() {
  group('BoardAssets Tests', () {
    test('Content filename should be retrieved', () async {
      var assets = await BoardAssets.get(assetBundle: TestAssetBundle());
      expect(assets.getContentFilename('/about'), 'content/about.md');
    });

    test('Content filenames should be retrieved', () async {
      var assets = await BoardAssets.get(assetBundle: TestAssetBundle());
      expect(assets.getContentFilenames('/blog'),
          ['content/blog/2020-10-01-HelloWorld.md']);
    });

    test('The specified file should be existed', () async {
      var assets = await BoardAssets.get(assetBundle: TestAssetBundle());
      expect(assets.isExisted('logo.png'), true);
    });

    test('The specified file should not be existed', () async {
      var assets = await BoardAssets.get(assetBundle: TestAssetBundle());
      expect(assets.isExisted('logo_not_found.png'), false);
    });

    test('The specified file should be file', () async {
      var assets = await BoardAssets.get(assetBundle: TestAssetBundle());
      expect(assets.isFile('logo.png'), true);
    });

    test('The specified route path should not be file', () async {
      var assets = await BoardAssets.get(assetBundle: TestAssetBundle());
      expect(assets.isFile('/images'), false);
    });

    test('The specified route path should be folder', () async {
      var assets = await BoardAssets.get(assetBundle: TestAssetBundle());
      expect(assets.isFolder('/images'), true);
    });

    test('The specified file should not be folder', () async {
      var assets = await BoardAssets.get(assetBundle: TestAssetBundle());
      expect(assets.isFolder('logo.png'), false);
    });
  });
}
