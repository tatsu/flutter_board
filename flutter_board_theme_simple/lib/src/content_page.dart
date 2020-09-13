import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';

import 'content_drawer.dart';
import 'content_markdown.dart';

class ContentPage extends StatefulWidget {
  ContentPage({key, this.isSubPage = false, this.liquid = false})
      : super(key: key);

  final bool isSubPage;
  final bool liquid;

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as MenuPageArguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(arguments.title),
        ),
        drawer: !widget.isSubPage ? ContentDrawer() : null,
        body: arguments.boardContext != null
            ? ContentMarkdown(liquid: widget.liquid)
            : FutureBuilder<BoardContext>(
                future: BoardContext.get(),
                builder: (BuildContext context,
                    AsyncSnapshot<BoardContext> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    arguments.routeGenerator.builderSettingsMap.forEach((k, v) {
                      v.arguments.boardContext = snapshot.data;
                    });
                    return ContentMarkdown(liquid: widget.liquid);
                  } else {
                    return Center(
                      child: Image.asset(
                        // TODO: Make the logo image customizable.
                        'packages/flutter_board_theme_simple/templates/images/logo.png',
                        width: 320,
                        fit: BoxFit.fitWidth,
                      ),
                    );
                  }
                }));
  }
}
