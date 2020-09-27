import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:flutter_board_theme_simple/flutter_board_theme_simple.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

/// A scrolling widget that parses and displays Markdown in an flutter board
/// simple theme application.
class ContentMarkdown extends StatelessWidget {
  /// Whether to use Liquid template or not.
  final liquid;

  /// Creates a scrolling widget that parses and displays Markdown.
  ContentMarkdown({key, this.liquid = false}) : super(key: key);

  /// Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    final settings = ModalRoute.of(context).settings;
    final PageArguments pageArguments = settings.arguments;
    return FutureBuilder<String>(
      future: MarkdownHelper.getMarkdown(
          settings.name != '/' ? settings.name : '/home',
          liquid: liquid),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Markdown(
            data: snapshot.data,
            onTapLink: (href) {
              const contentPath = 'resource:content';
              if (href.startsWith(contentPath)) {
                var uri = href.substring(contentPath.length);
                Navigator.pushNamed(context, uri, arguments: pageArguments);
              } else {
                launch(href);
              }
            },
            selectable: true,
            styleSheet: pageArguments is MarkdownPageArguments
                ? pageArguments.markdownStyleSheet
                : null,
          );
        }
        return Container();
      },
    );
  }
}
