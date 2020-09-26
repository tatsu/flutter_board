import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';

import 'content_drawer.dart';
import 'content_markdown.dart';

class ContentPage extends StatelessWidget {
  final bool subPage;
  final bool liquid;

  ContentPage({key, this.subPage = false, this.liquid = false})
      : super(key: key);

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
                future: BoardContext.get(),
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

  Widget getContentWidget(BuildContext context) =>
      ContentMarkdown(liquid: liquid);

  Widget getSplashWidget(BuildContext context) => Center(
        child: Image.asset(
          'packages/flutter_board_theme_simple/content/images/logo.png',
          width: 320,
          fit: BoxFit.fitWidth,
        ),
      );
}
