import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:flutter_board_theme_simple/flutter_board_theme_simple.dart';

abstract class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();

  Widget buildContent(BuildContext context);
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as PageArguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(arguments.title),
        ),
        drawer: MainDrawer(),
        body: arguments.boardContext != null
            ? widget.buildContent(context)
            : FutureBuilder<BoardContext>(
                future: BoardContext.get(),
                builder: (BuildContext context,
                    AsyncSnapshot<BoardContext> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    arguments.routeGenerator.builderSettingsMap.forEach((k, v) {
                      v.arguments.boardContext = snapshot.data;
                    });
                    return widget.buildContent(context);
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
