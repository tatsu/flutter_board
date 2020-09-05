import 'package:flutter/material.dart';

import 'page.dart' as page;

class AboutPage extends page.Page {
  AboutPage({Key key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Under construction',
          ),
        ],
      ),
    );
  }
}
