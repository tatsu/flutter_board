import 'package:flutter/services.dart';
import 'package:liquid_engine/liquid_engine.dart';
import 'package:yaml/yaml.dart';

import 'board_assets.dart';
import 'board_config.dart';

/// Helper functions for markdown files.
class MarkdownHelper {
  /// Gets markdown file variables.
  static Future<Map<String, dynamic>> getFileVariables(String filename) async {
    var meta = {'filename': filename};
    var exp = RegExp(r'^.*/(\d{4}-\d{2}-\d{2})-(.+?)(\.[^.]+)?$');
    Match match = exp.firstMatch(filename);
    if (match != null) {
      meta['date'] = match[1];
      meta['slug'] = match[2];
    }
    if (filename.endsWith('.md') || filename.endsWith('.markdown')) {
      var header = await getMarkdownHeader(filename);
      meta.addAll(header);
    }

    return meta;
  }

  /// Gets markdown file content.
  static Future<String> getMarkdown(String contentName,
      {liquid = false}) async {
    var assets = await BoardAssets.get();

    var filename = assets.getContentFilename(contentName);
    if (filename == null) return '';

    var string = await rootBundle.loadString(filename);

    if (string.startsWith('---')) {
      var exp = RegExp(r'^---\s*$\r?\n', multiLine: true);
      Match match = exp.firstMatch(string);
      if (match != null) {
        var yamlStart = string.substring(match.end);
        match = exp.firstMatch(yamlStart);
        if (match != null) {
          var yamlString = yamlStart.substring(0, match.start);
          if (yamlString.isNotEmpty) {
            string = yamlStart.substring(match.end);
          }
        }
      }
    }

    if (liquid) {
      var config = await BoardConfig.get();
      var contentContext = Context.create();
      contentContext.variables = Map.from(config);
      contentContext.variables['content'] = contentName;

      var meta = await getFileVariables(filename);
      contentContext.variables.addAll(meta);

      var filenames = assets.getContentFilenames(contentName);
      var files = <Map<String, dynamic>>[];
      for (var filename in filenames) {
        var meta = await getFileVariables(filename);
        files.add(meta);
      }
      contentContext.variables['files'] = files;

      string = _parseLiquid(string, contentContext);
    }

    return string;
  }

  /// Get markdown file header yaml.
  static Future<Map<String, dynamic>> getMarkdownHeader(
      String contentName) async {
    var assets = await BoardAssets.get();
    if (!assets.isFile(contentName)) return {};

    var filename = assets.getContentFilename(contentName);
    if (filename == null) return {};

    var string = await rootBundle.loadString(filename);

    if (string.startsWith('---')) {
      var exp = RegExp(r'^---\s*$\r?\n', multiLine: true);
      Match match = exp.firstMatch(string);
      if (match != null) {
        var yamlStart = string.substring(match.end);
        match = exp.firstMatch(yamlStart);
        if (match != null) {
          var yamlString = yamlStart.substring(0, match.start);
          if (yamlString.isNotEmpty) {
            return Map.from(loadYaml(yamlString));
          }
        }
      }
    }

    return {};
  }

  /// Gets markdown file content rendered by Liquid.
  static Future<String> getMarkdownLiquid(String contentName) async {
    return getMarkdown(contentName, liquid: true);
  }

  static String _parseLiquid(String source, Context context) {
    final template = Template.parse(context, Source.fromString(source));
    return template.render(context);
  }
}
