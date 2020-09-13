import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentMarkdown extends StatelessWidget {
  ContentMarkdown({key, this.liquid = false}) : super(key: key);

  final liquid;

  @override
  Widget build(BuildContext context) {
    final settings = ModalRoute.of(context).settings;
    final PageArguments pageArgument = settings.arguments;
    return FutureBuilder<String>(
      future: BoardParser.getMarkdown(
          settings.name != '/' ? settings.name : '/home',
          liquid: liquid),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Markdown(
            data: snapshot.data,
            onTapLink: (href) {
              const contentPath = 'resource:content';
              if (href.startsWith(contentPath)) {
                String uri = href.substring(contentPath.length);
                Navigator.pushNamed(context, uri, arguments: pageArgument);
              } else {
                launch(href);
              }
            },
            selectable: true,
          );
        }
        return Container();
      },
    );
  }
}
