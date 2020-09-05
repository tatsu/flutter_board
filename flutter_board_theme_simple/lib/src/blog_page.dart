import 'package:flutter/material.dart';

import 'page.dart' as page;

class BlogPage extends page.Page {
  BlogPage({Key key, String title, ListTile menuItem})
      : super(key: key, title: title, menuItem: menuItem);

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
