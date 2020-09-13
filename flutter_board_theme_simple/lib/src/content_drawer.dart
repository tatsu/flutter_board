import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:path/path.dart' as p;

class ContentDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as PageArguments;
    final config = arguments.boardContext?.config;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            accountName: config?.containsKey('author') == true
                ? Text(config['author'])
                : null,
            accountEmail: config?.containsKey('email') == true
                ? Text(config['email'])
                : null,
            currentAccountPicture: config?.containsKey('avatar') == true
                ? CircleAvatar(
                    backgroundImage:
                        AssetImage(p.join('content', config['avatar'])))
                : CircleAvatar(
                    child: FlutterLogo(size: 42.0),
                    backgroundColor: Colors.white,
                  ),
          ),
          ..._getMenuItems(context),
        ],
      ),
    );
  }

  List<Widget> _getMenuItems(BuildContext context) {
    final materialApp = context.findAncestorWidgetOfExactType<MaterialApp>();
    final PageArguments arguments = ModalRoute.of(context).settings.arguments;
    final menuItems = <Widget>[];
    arguments.routeGenerator.builderSettingsMap.forEach((k, v) {
      var arg = v.arguments as MenuPageArguments;
      if (arg != null) {
        menuItems.add(ListTile(
          leading: arg.icon,
          title: Text(arg.title),
          onTap: () {
            Navigator.popUntil(
                context, ModalRoute.withName(materialApp.initialRoute));
            if (k != materialApp.initialRoute) {
              Navigator.pushNamed(context, k, arguments: arguments);
            }
          },
        ));
      }
    });
    return menuItems;
  }
}
