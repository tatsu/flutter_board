import 'board_assets.dart';
import 'board_config.dart';

class BoardContext {
  static BoardContext _instance;

  BoardConfig config;
  BoardAssets assets;

  static Future<BoardContext> get() async {
    if (_instance == null) {
      _instance = BoardContext._internal();
      _instance.config = await BoardConfig.get();
      _instance.assets = await BoardAssets.get();
    }
    return _instance;
  }

  BoardContext._internal();
}
