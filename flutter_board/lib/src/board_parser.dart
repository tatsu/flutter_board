import 'package:flutter/services.dart';
import 'package:liquid_engine/liquid_engine.dart';
import 'package:yaml/yaml.dart';

import 'board_assets.dart';
import 'board_config.dart';

class BoardParser {
  static Future<String> getMarkdown(String contentName,
      {liquid = false}) async {
    var assets = await BoardAssets.get();
    if (!assets.isFile(contentName)) return '';

    var filenames = assets.getContentFiles(contentName);
    var filename = filenames.firstWhere(
        (element) => element.startsWith('content/'),
        orElse: () => null);
    if (filename == null) return '';

    var string = await rootBundle.loadString(filename);

    if (string.startsWith('---')) {
      RegExp exp = new RegExp(r"^---\s*$\r?\n", multiLine: true);
      Match match = exp.firstMatch(string);
      if (match != null) {
        String yamlStart = string.substring(match.end);
        match = exp.firstMatch(yamlStart);
        if (match != null) {
          String yamlString = yamlStart.substring(0, match.start);
          if (yamlString.isNotEmpty) {
            string = yamlStart.substring(match.end);
          }
        }
      }
    }

    if (liquid) {
      var config = await BoardConfig.get();
      Context contentContext = Context.create();
      contentContext.variables = Map.from(config);
      string = _parseLiquid(string, contentContext);
    }

    return string;
  }

  static Future<Map<String, dynamic>> getMarkdownHeader(
      String contentName) async {
    var assets = await BoardAssets.get();
    if (!assets.isFile(contentName)) return {};

    var filenames = assets.getContentFiles(contentName);
    var filename = filenames.firstWhere(
        (element) => element.startsWith('content/'),
        orElse: () => null);
    if (filename == null) return {};

    var string = await rootBundle.loadString(filename);

    if (string.startsWith('---')) {
      RegExp exp = new RegExp(r"^---\s*$\r?\n", multiLine: true);
      Match match = exp.firstMatch(string);
      if (match != null) {
        String yamlStart = string.substring(match.end);
        match = exp.firstMatch(yamlStart);
        if (match != null) {
          String yamlString = yamlStart.substring(0, match.start);
          if (yamlString.isNotEmpty) {
            return Map.from(loadYaml(yamlString));
          }
        }
      }
    }

    return {};
  }

  static Future<String> getMarkdownLiquid(String contentName) async {
    return getMarkdown(contentName, liquid: true);
  }

  static String _parseLiquid(String source, Context context) {
    final template = Template.parse(context, Source.fromString(source));
    return template.render(context);
  }
}
