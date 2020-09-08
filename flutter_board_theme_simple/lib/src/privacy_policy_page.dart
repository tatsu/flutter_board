import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';

import 'page.dart' as page;

class PrivacyPolicyPage extends page.Page {
  @override
  Widget buildContent(BuildContext context) {
    final settings = ModalRoute.of(context).settings;
    final PageArguments pageArgument = settings.arguments;
    return FutureBuilder<String>(
      future: pageArgument.boardContext.assets
          .getContentHtml(settings.name, 'layouts/default.html'),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return EasyWebView(
            src: snapshot.data,
            isHtml: true,
            convertToWidgets: true,
            onLoaded: () => print('loaded'),
          );
        }
        return Container();
      },
    );
  }
}
