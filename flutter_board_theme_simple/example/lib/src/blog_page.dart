import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:flutter_board_theme_simple/flutter_board_theme_simple.dart';

class BlogPage extends ContentPage {
  @override
  Widget getContentWidget(BuildContext context) {
    final settings = ModalRoute.of(context).settings;
    final arguments = settings.arguments as MenuPageArguments;
    final assets = arguments?.boardContext?.assets;
    final files = assets?.getContentFilenames(settings.name) ?? <String>[];

    return ListView.builder(
        itemCount: files.length,
        itemBuilder: (context, position) {
          return FutureBuilder<Map<String, dynamic>>(
            future: BoardParser.getFileVariables(files[position]),
            builder: (BuildContext context,
                AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final data = snapshot.data;
                return Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: ListTile(
                      leading: data['image'] != null
                          ? ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              child: Image.asset(data['image']))
                          : null,
                      title: Text(data['title'] ?? 'No title'),
                      subtitle: Text("${data['date']} ${data['description']}" ??
                          'No description'),
                      onTap: () {
                        Navigator.pushNamed(
                            context, '${settings.name}/${data['slug']}',
                            arguments: arguments);
                      },
                    ));
              }
              return Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          );
        });
  }
}
