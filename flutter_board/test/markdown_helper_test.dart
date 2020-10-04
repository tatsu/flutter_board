import 'package:flutter_board/flutter_board.dart';
import 'package:test/test.dart';

import 'test_asset_bundle.dart';

void main() {
  group('MarkdownHelper Tests', () {
    test('File variables should be retrieved', () async {
      var variables = await MarkdownHelper.getFileVariables(
          'content/blog/2020-10-01-HelloWorld.md',
          assetBundle: TestAssetBundle());
      expect(variables['date'], '2020-10-01');
      expect(variables['slug'], 'HelloWorld');
      expect(variables['title'], 'This is a title');
    });
    test('Markdown content should be retrieved', () async {
      var content = await MarkdownHelper.getMarkdown('/blog/HelloWorld',
          assetBundle: TestAssetBundle());
      expect(content, '{{ date }}');
    });
    test('Liquid templated markdown content should be retrieved', () async {
      var content = await MarkdownHelper.getMarkdown('/blog/HelloWorld',
          liquid: true, assetBundle: TestAssetBundle());
      expect(content, '2020-10-01');
    });
    test('Markdown header yaml should be retrieved', () async {
      var variables = await MarkdownHelper.getMarkdownHeader('/blog/HelloWorld',
          assetBundle: TestAssetBundle());
      expect(variables.length, 1);
      expect(variables['title'], 'This is a title');
    });
  });
}
