import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';

import 'content_drawer.dart';
import 'content_markdown.dart';

/// Implements the basic material design visual layout structure of content
/// pages in an flutter board simple theme application.
class ContentPage extends StatelessWidget {
  /// Whether it is the sub page on the main page or not.
  final bool subPage;

  /// Whether to use Liquid template or not.
  final bool liquid;

  /// Creates a visual scaffold for material design widgets of content pages.
  ContentPage({key, this.subPage = false, this.liquid = false})
      : super(key: key);

  /// Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as MenuPageArguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(arguments.title),
        ),
        drawer: !subPage ? ContentDrawer() : null,
        body: arguments.boardContext != null
            ? getContentWidget(context)
            : FutureBuilder<BoardContext>(
                future: Future.delayed(Duration(seconds: 2), () async {
                  return BoardContext.get();
                }),
                builder: (BuildContext context,
                    AsyncSnapshot<BoardContext> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    arguments.routeGenerator.builderSettingsMap.forEach((k, v) {
                      v.arguments.boardContext = snapshot.data;
                    });
                    return getContentWidget(context);
                  } else {
                    return getSplashWidget(context);
                  }
                }));
  }

  /// Gets a content markdown widget.
  Widget getContentWidget(BuildContext context) =>
      ContentMarkdown(liquid: liquid);

  /// Gets a splash widget.
  Widget getSplashWidget(BuildContext context) => Center(
        child: Image.asset(
          'packages/flutter_board_theme_simple/content/images/logo.png',
          width: 320,
          fit: BoxFit.fitWidth,
        ),
      );
}
