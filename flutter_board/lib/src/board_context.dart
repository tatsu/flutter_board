import 'package:async/async.dart';

import 'board_assets.dart';
import 'board_config.dart';

class BoardContext {
  static BoardContext _instance;
  static final _instanceMemo = AsyncMemoizer<BoardContext>();

  BoardConfig config;
  BoardAssets assets;

  static Future<BoardContext> get() async {
    if (_instance == null) {
      _instance = await _instanceMemo.runOnce(() async {
        var instance = BoardContext._internal();
        await await Future.delayed(Duration(seconds: 2)); // TODO: Remove
        instance.config = await BoardConfig.get();
        instance.assets = await BoardAssets.get();
        return instance;
      });
    }
    return _instance;
  }

  BoardContext._internal();
}
