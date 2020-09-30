import 'package:flutter/material.dart';
import 'package:flutter_board_theme_simple/flutter_board_theme_simple.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:test/test.dart';

void main() {
  group('MarkdownPageArguments Tests', () {
    var stylesheet = MarkdownStyleSheet();
    var arguments = MarkdownPageArguments(
      title: 'foo',
      icon: Icon(Icons.add),
      markdownStyleSheet: stylesheet,
    );

    test('The stylesheet should be set', () {
      expect(arguments.markdownStyleSheet, stylesheet);
    });
  });
}
