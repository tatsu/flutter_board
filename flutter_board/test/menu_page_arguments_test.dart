import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:test/test.dart';

void main() {
  group('MenuPageArguments Tests', () {
    var title = 'A title';
    var icon = Icon(Icons.add);
    var arguments = MenuPageArguments(
      title: title,
      icon: icon,
    );

    test('The parameters should be set', () {
      expect(arguments.title, title);
      expect(arguments.icon, icon);
    });
  });
}
