import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';

import 'widgets/main_drawer.dart';

class AboutPage extends StatelessWidget implements ContentPage {
  AboutPage({Key key, this.title, this.menuItem}) : super(key: key);

  final String title;
  final ListTile menuItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
}
