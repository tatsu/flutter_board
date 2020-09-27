import 'package:async/async.dart';

import 'board_assets.dart';
import 'board_config.dart';

class BoardContext {
  static BoardContext _instance;
  static final _instanceMemo = AsyncMemoizer<BoardContext>();

  BoardConfig config;
  BoardAssets assets;

  BoardContext._internal();

  static Future<BoardContext> get() async {
    if (_instance == null) {
      _instance = await _instanceMemo.runOnce(() async {
        var instance = BoardContext._internal();
        instance.config = await BoardConfig.get();
        instance.assets = await BoardAssets.get();
        return instance;
      });
    }
    return _instance;
  }
}
