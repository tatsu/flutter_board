import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:flutter_board_theme_simple/flutter_board_theme_simple.dart';

abstract class Page extends StatelessWidget implements ContentPage {
  Page({Key key, this.title, this.menuItem}) : super(key: key);

  final String title;
  final ListTile menuItem;
  final PageArguments _arguments = PageArguments();

  @override
  Widget build(BuildContext context) {
    final PageArguments arguments =
        ModalRoute.of(context).settings.arguments ?? _arguments;

    return arguments.config != null
        ? Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            drawer: MainDrawer(arguments: arguments),
            body: buildContent(context),
          )
        : FutureBuilder<Config>(
            future: Config.get(),
            builder: (BuildContext context, AsyncSnapshot<Config> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                arguments.config = snapshot.data;
                return Scaffold(
                  appBar: AppBar(
                    title: Text(title),
                  ),
                  drawer: MainDrawer(arguments: arguments),
                  body: buildContent(context),
                );
              }
              return Scaffold(
                appBar: AppBar(
                  title: Text(title),
                ),
                body: Center(
                  child: Image.asset(
                    // TODO: Make the logo image customizable.
                    'packages/flutter_board_theme_simple/templates/images/logo.png',
                    width: 320,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              );
            },
          );
  }

  Widget buildContent(BuildContext context);
}
