import 'package:flutter/material.dart';

import 'widgets/main_drawer.dart';

class BlogPage extends StatelessWidget {
  static const String route = '/blog';

  BlogPage({Key key, this.title}) : super(key: key);

  final String title;

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
