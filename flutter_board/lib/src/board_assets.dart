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

  String getContentFilename(String route) {
    var slashPos = route.lastIndexOf('/');
    var path = route.substring(0, slashPos + 1);
    var slug = route.substring(slashPos + 1);
    return _assets.firstWhere((element) {
      RegExp exp =
          RegExp("^(.*?)$path(\\d{4}-\\d{2}-\\d{2}-)?$slug(\\.[^.]+)?\$");
      Match match = exp.firstMatch(element);
      return match != null;
    });
  }

  List<String> getContentFilenames(String route) {
    return _assets.where((element) => element.contains(route + '/')).toList();
  }

  bool isExisted(String route) {
    return isFile(route) || isFolder(route);
  }

  bool isFile(String route) {
    if (isFolder(route)) return false;
    var slashPos = route.lastIndexOf('/');
    var path = route.substring(0, slashPos + 1);
    var slug = route.substring(slashPos + 1);
    return _assets.firstWhere((element) {
          RegExp exp =
              RegExp("^(.*?)$path(\\d{4}-\\d{2}-\\d{2}-)?$slug(\\.[^.]+)?\$");
          Match match = exp.firstMatch(element);
          return match != null;
        }, orElse: null) !=
        null;
  }

  bool isFolder(String route) {
    return _assets.firstWhere((element) => element.contains(route + '/'),
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
