import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class Config {
  static Config _instance;

  YamlMap _yamlMap;

  static Future<Config> get() async {
    if (_instance == null) {
      _instance = Config._internal();
      _instance._yamlMap = await _instance._load();
    }
    return _instance;
  }

  operator [](String key) => _yamlMap[key];

  Config._internal();

  Future<YamlMap> _load() async {
    var yaml = await rootBundle.loadString('content/config.yaml');
    return loadYaml(yaml);
  }
}
