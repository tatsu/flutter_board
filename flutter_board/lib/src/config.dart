import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class Config implements Map {
  static Config _instance;

  YamlMap _yamlMap;

  static Future<Config> get() async {
    if (_instance == null) {
      await Future.delayed(Duration(seconds: 2)); // TODO: Remove
      _instance = Config._internal();
      _instance._yamlMap = await _instance._load();
    }
    return _instance;
  }

  Config._internal();

  Future<YamlMap> _load() async {
    var yaml = await rootBundle.loadString('content/config.yaml');
    return loadYaml(yaml);
  }

  @override
  operator [](Object key) => _yamlMap[key];

  @override
  void operator []=(key, value) => _yamlMap[key] = value;

  @override
  void addAll(Map other) => _yamlMap.addAll(other);

  @override
  void addEntries(Iterable<MapEntry> newEntries) =>
      _yamlMap.addEntries(newEntries);

  @override
  Map<RK, RV> cast<RK, RV>() => _yamlMap.cast<RK, RV>();

  @override
  void clear() => _yamlMap.clear();

  @override
  bool containsKey(Object key) => _yamlMap.containsKey(key);

  @override
  bool containsValue(Object value) => _yamlMap.containsValue(value);

  @override
  Iterable<MapEntry> get entries => _yamlMap.entries;

  @override
  void forEach(void Function(Object key, Object value) f) =>
      _yamlMap.forEach(f);

  @override
  bool get isEmpty => _yamlMap.isEmpty;

  @override
  bool get isNotEmpty => _yamlMap.isNotEmpty;

  @override
  Iterable get keys => _yamlMap.keys;

  @override
  int get length => _yamlMap.length;

  @override
  Map<K2, V2> map<K2, V2>(
          MapEntry<K2, V2> Function(Object key, Object value) f) =>
      _yamlMap.map<K2, V2>(f);

  @override
  putIfAbsent(key, Function() ifAbsent) => _yamlMap.putIfAbsent(key, ifAbsent);

  @override
  remove(Object key) => _yamlMap.remove(key);

  @override
  void removeWhere(bool Function(Object key, Object value) predicate) =>
      _yamlMap.removeWhere(predicate);

  @override
  update(key, Function(Object value) update, {Function() ifAbsent}) =>
      _yamlMap.update(key, update, ifAbsent: ifAbsent);

  @override
  void updateAll(Function(Object key, Object value) update) =>
      _yamlMap.updateAll(update);

  @override
  Iterable get values => _yamlMap.values;
}
