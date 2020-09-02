import 'package:flutter/material.dart';

import 'widgets/main_drawer.dart';

class AboutPage extends StatelessWidget {
  static const String route = '/about';

  AboutPage({Key key, this.title}) : super(key: key);

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
