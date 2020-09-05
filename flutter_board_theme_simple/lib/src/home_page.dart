import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:flutter_board_theme_simple/flutter_board_theme_simple.dart';

class HomePage extends StatefulWidget implements ContentPage {
  HomePage({Key key, this.title, this.menuItem}) : super(key: key);

  final String title;
  final ListTile menuItem;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Config _config;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Config>(
        future: Config.get(),
        builder: (BuildContext context, AsyncSnapshot<Config> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            _config = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              drawer: MainDrawer(),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Under construction',
                    ),
                  ],
                ),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Image.asset(
                // TODO: Be the image customizable.
                'packages/flutter_board_theme_simple/templates/images/logo.png',
                width: 320,
                fit: BoxFit.fitWidth,
              ),
            ),
          );
        },
      ),
    );
  }
}
