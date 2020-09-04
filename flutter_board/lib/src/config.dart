import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class Config {
  static Config _instance = Config._internal();

  YamlMap _yamlMap;

  factory Config() => _instance;

  Future<YamlMap> get() async {
    if (_yamlMap == null) {
      _yamlMap = await _load();
    }
    return _yamlMap;
  }

  Config._internal();

  Future<YamlMap> _load() async {
    var yaml = await rootBundle.loadString('content/config.yaml');
    return loadYaml(yaml);
  }
}
