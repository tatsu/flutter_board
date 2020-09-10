import 'dart:collection';

import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class BoardConfig with MapMixin<String, dynamic> {
  static BoardConfig _instance;

  YamlMap _yamlMap;

  static Future<BoardConfig> get() async {
    if (_instance == null) {
      await Future.delayed(Duration(seconds: 2)); // TODO: Remove
      _instance = BoardConfig._internal();
      _instance._yamlMap = await _instance._load();
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
