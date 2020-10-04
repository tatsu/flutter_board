import 'dart:typed_data';

import 'package:flutter/services.dart';

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    switch (key) {
      case 'AssetManifest.json':
        return '{"content/config.yaml":["content/config.yaml"],"content/images/logo.png":["content/images/logo.png"],"content/about.md":["content/about.md"],"content/blog/2020-10-01-HelloWorld.md":["content/blog/2020-10-01-HelloWorld.md"]}';
      case 'content/config.yaml':
        return '''
name: 'Flutterboard'
author: 'Tatsuhiko Arai'
email: 'tatsu@tatsu.com'
        ''';
      case 'content/blog/2020-10-01-HelloWorld.md':
        return '''
---
title: This is a title
---
{{ date }}''';
    }
    return super.loadString(key, cache: cache);
  }

  @override
  Future<ByteData> load(String key) {
    throw UnimplementedError();
  }
}
