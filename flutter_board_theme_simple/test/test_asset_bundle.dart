import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class TestAssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (key == '/foo.md') {
      return 'Hello World!';
    }
    return super.loadString(key, cache: cache);
  }

  @override
  Future<ByteData> load(String key) async {
    if (key == 'resources/test') {
      return ByteData.view(
          Uint8List.fromList(utf8.encode('Hello World!')).buffer);
    }
    return null;
  }
}
