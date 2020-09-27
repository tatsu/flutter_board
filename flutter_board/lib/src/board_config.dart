import 'dart:collection';

import 'package:async/async.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

/// A configuration manager of the application using this package.
class BoardConfig with MapMixin<String, dynamic> {
  static BoardConfig _instance;
  static final _instanceMemo = AsyncMemoizer<BoardConfig>();

  YamlMap _yamlMap;

  BoardConfig._internal();

  @override
  Iterable<String> get keys => _yamlMap.keys.map((e) => e as String);

  @override
  dynamic operator [](Object key) => _yamlMap[key];

  @override
  void operator []=(key, value) => _yamlMap[key] = value;

  @override
  void clear() => _yamlMap.clear();

  @override
  dynamic remove(Object key) => _yamlMap.remove(key);

  Future<YamlMap> _load() async {
    var yaml = await rootBundle.loadString('content/config.yaml');
    return loadYaml(yaml);
  }

  /// Creates or returns a singleton instance of a configuration manager.
  static Future<BoardConfig> get() async {
    _instance ??= await _instanceMemo.runOnce(() async {
      var instance = BoardConfig._internal();
      instance._yamlMap = await instance._load();
      return instance;
    });
    return _instance;
  }
}
