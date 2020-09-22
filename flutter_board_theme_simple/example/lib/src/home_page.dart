import 'package:flutter/material.dart';
import 'package:flutter_board_theme_simple/flutter_board_theme_simple.dart';

class HomePage extends ContentPage {
  @override
  Widget getContentWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Flatterboard Simple Theme Demo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
