import 'dart:collection';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:liquid_engine/liquid_engine.dart';
import 'package:markdown/markdown.dart' as md;

import 'board_config.dart';

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

  bool isExisted(String path) {
    return _assets.firstWhere((element) => element.contains(path),
            orElse: () => null) !=
        null;
  }

  bool isFolder(String path) {
    return _assets.firstWhere((element) => element.contains(path + '/'),
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

  List<String> getContentFiles(String path) {
    return _assets.where((element) => element.contains(path)).toList();
  }

  Future<String> getContentHtml(
      String contentName, String defaultLayout) async {
    if (!isFile(contentName)) return '';

    var filenames = getContentFiles(contentName);
    var filename = filenames.firstWhere(
        (element) => element.startsWith('content/'),
        orElse: () => null);
    if (filename == null) return '';

    var config = await BoardConfig.get();
    Context contentContext = Context.create();
    contentContext.variables = Map.from(config);

    var string = await rootBundle.loadString(filename);
    String content =
        parseContent(string, contentContext, filename.endsWith('.md'));

    filenames = getContentFiles(defaultLayout);
    filename = filenames.firstWhere((element) => element.startsWith('content/'),
        orElse: () => null);
    if (filename == null && config['theme'] != null) {
      filename = filenames.firstWhere(
          (element) => element.startsWith('packages/${config['theme']}/'),
          orElse: () => null);
    }
    if (filename == null) return content;

    var layout = await rootBundle.loadString(filename);
    contentContext.variables['content'] = content;
    String page = Template.parse(contentContext, Source.fromString(layout))
        .render(contentContext);

    return page;
  }

  String parseContent(String source, Context context, [bool isMd = false]) {
    RegExp exp = new RegExp(r"^---\s*$\r?\n", multiLine: true);
    Match match = exp.firstMatch(source);
    if (match != null) {
      String yamlStart = source.substring(match.end);
      match = exp.firstMatch(yamlStart);
      if (match != null) {
        String yamlString = yamlStart.substring(0, match.start);
        if (yamlString != null && yamlString.isNotEmpty) {
          // Nothing to do here now...
        }
        source = yamlStart.substring(match.end);
      }
    }

    String content;
    if (isMd) {
      content = md.markdownToHtml(source);
      if (content == null) return null;
    } else {
      content = source;
    }

    final template = Template.parse(context, Source.fromString(content));
    return template.render(context);
  }
}
