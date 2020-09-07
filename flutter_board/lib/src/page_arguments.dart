import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:flutter_board/src/board_context.dart';

class PageArguments {
  PageArguments(
      {this.title, this.icon, this.routeGenerator, this.boardContext});

  String title;
  Widget icon;
  RouteGenerator routeGenerator;
  BoardContext boardContext;
}
