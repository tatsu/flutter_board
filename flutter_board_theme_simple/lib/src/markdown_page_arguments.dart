import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

/// Arguments passed to the markdown content page route.
class MarkdownPageArguments extends MenuPageArguments {
  /// Defines which [TextStyle] objects to use for which Markdown elements.
  MarkdownStyleSheet markdownStyleSheet;

  /// Creates arguments used to construct the markdown content page route.
  MarkdownPageArguments(
      {@required title,
      @required icon,
      this.markdownStyleSheet,
      routeGenerator,
      boardContext})
      : super(
            title: title,
            icon: icon,
            routeGenerator: routeGenerator,
            boardContext: boardContext);
}
