import 'package:flutter/material.dart';

import 'page.dart' as page;

class DocsPage extends page.Page {
  DocsPage({Key key}) : super(key: key);

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
