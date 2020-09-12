import 'dart:collection';

import 'package:async/async.dart';
import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class BoardConfig with MapMixin<String, dynamic> {
  static BoardConfig _instance;
  static final _instanceMemo = AsyncMemoizer<BoardConfig>();

  YamlMap _yamlMap;

  static Future<BoardConfig> get() async {
    if (_instance == null) {
      _instance = await _instanceMemo.runOnce(() async {
        var instance = BoardConfig._internal();
        await await Future.delayed(Duration(seconds: 2)); // TODO: Remove
        instance._yamlMap = await instance._load();
        return instance;
      });
    }
    return _instance;
  }

  BoardConfig._internal();

  Future<YamlMap> _load() async {
    var yaml = await rootBundle.loadString('content/config.yaml');
    return loadYaml(yaml);
  }

  @override
  operator [](Object key) => _yamlMap[key];

  @override
  void operator []=(key, value) => _yamlMap[key] = value;

  @override
  void clear() => _yamlMap.clear();

  @override
  Iterable<String> get keys => _yamlMap.keys.map((e) => e as String);

  @override
  remove(Object key) => _yamlMap.remove(key);
}
