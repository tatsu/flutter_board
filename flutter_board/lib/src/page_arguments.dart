import 'board_context.dart';
import 'route_generator.dart';

/// Arguments passed to the content page route.
class PageArguments {
  /// The generator for the routes.
  RouteGenerator routeGenerator;

  /// The handle to the configuration and assets.
  BoardContext boardContext;

  /// Creates arguments used to construct the content page route.
  PageArguments({this.routeGenerator, this.boardContext});
}
