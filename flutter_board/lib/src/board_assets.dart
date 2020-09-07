import 'dart:collection';
import 'dart:convert';

import 'package:flutter/services.dart';

class BoardAssets with ListMixin<String> {
  static BoardAssets _instance;

  List<String> _assets;

  static Future<BoardAssets> get() async {
    if (_instance == null) {
      _instance = BoardAssets._internal();
      _instance._assets = await _instance._load();
    }
    return _instance;
  }

  BoardAssets._internal();

  Future<List<String>> _load() async {
    var assets = <String>[];
    var string = await rootBundle.loadString('AssetManifest.json');
    Map<String, dynamic> assetsMap = jsonDecode(string);
    assetsMap.keys.forEach(assets.add);
    return assets;
  }

  @override
  int get length => _assets.length;

  @override
  set length(int newLength) => throw UnsupportedError;

  @override
  String operator [](int index) => _assets[index];

  @override
  void operator []=(int index, String value) => _assets[index] = value;
}
