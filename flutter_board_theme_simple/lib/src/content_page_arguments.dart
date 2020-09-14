import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ContentPageArguments extends MenuPageArguments {
  MarkdownStyleSheet markdownStyleSheet;

  ContentPageArguments(
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
