import 'dart:collection';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:flutter/services.dart';

class BoardAssets with ListMixin<String> {
  static BoardAssets _instance;
  static final _instanceMemo = AsyncMemoizer<BoardAssets>();

  List<String> _assets;

  BoardAssets._internal();

  @override
  int get length => _assets.length;

  @override
  set length(int newLength) => throw UnsupportedError;

  @override
  String operator [](int index) => _assets[index];

  @override
  void operator []=(int index, String value) => _assets[index] = value;

  List<String> getContentFiles(String path) {
    return _assets.where((element) => element.contains(path)).toList();
  }

  bool isExisted(String path) {
    return _assets.firstWhere((element) => element.contains(path),
            orElse: () => null) !=
        null;
  }

  bool isFile(String path) {
    return _assets.firstWhere(
            (element) =>
                element.contains(path) && !element.contains(path + '/'),
            orElse: () => null) !=
        null;
  }

  bool isFolder(String path) {
    return _assets.firstWhere((element) => element.contains(path + '/'),
            orElse: () => null) !=
        null;
  }

  Future<List<String>> _load() async {
    var assets = <String>[];
    var string = await rootBundle.loadString('AssetManifest.json');
    Map<String, dynamic> assetsMap = jsonDecode(string);
    assetsMap.keys.forEach(assets.add);
    return assets;
  }

  static Future<BoardAssets> get() async {
    if (_instance == null) {
      _instance = await _instanceMemo.runOnce(() async {
        var instance = BoardAssets._internal();
        await await Future.delayed(Duration(seconds: 2)); // TODO: Remove
        instance._assets = await instance._load();
        return instance;
      });
    }
    return _instance;
  }
}
