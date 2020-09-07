import 'package:flutter_board/flutter_board.dart';

import 'config.dart';

class BoardContext {
  static BoardContext _instance;

  Config config;
  BoardAssets assets;

  static Future<BoardContext> get() async {
    if (_instance == null) {
      _instance = BoardContext._internal();
      _instance.config = await Config.get();
      _instance.assets = await BoardAssets.get();
    }
    return _instance;
  }

  BoardContext._internal();
}
