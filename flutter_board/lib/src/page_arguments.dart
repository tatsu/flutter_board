import 'board_context.dart';
import 'route_generator.dart';

class PageArguments {
  PageArguments({this.routeGenerator, this.boardContext});

  RouteGenerator routeGenerator;
  BoardContext boardContext;
}
