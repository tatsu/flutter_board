import 'package:async/async.dart';

import 'board_assets.dart';
import 'board_config.dart';

/// A handle to the configuration and assets of the application using this
/// package.
class BoardContext {
  static BoardContext _instance;
  static final _instanceMemo = AsyncMemoizer<BoardContext>();

  /// The configuration of the application.
  BoardConfig config;

  /// The assets of the application.
  BoardAssets assets;

  BoardContext._internal();

  /// Creates or returns a singleton instance of a handle.
  static Future<BoardContext> get() async {
    _instance ??= await _instanceMemo.runOnce(() async {
      var instance = BoardContext._internal();
      instance.config = await BoardConfig.get();
      instance.assets = await BoardAssets.get();
      return instance;
    });
    return _instance;
  }
}
