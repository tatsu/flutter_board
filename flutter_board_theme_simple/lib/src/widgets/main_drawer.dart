import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:path/path.dart' as p;

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as PageArguments;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            accountName: arguments.config?.containsKey('author') == true
                ? Text(arguments.config['author'])
                : null,
            accountEmail: arguments.config?.containsKey('email') == true
                ? Text(arguments.config['email'])
                : null,
            currentAccountPicture:
                arguments.config?.containsKey('avatar') == true
                    ? CircleAvatar(
                        backgroundImage: AssetImage(
                            p.join('content', arguments.config['avatar'])))
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
      final args = v.arguments as PageArguments;
      menuItems.add(ListTile(
        leading: args.icon,
        title: Text(args.title),
        onTap: () {
          Navigator.popUntil(
              context, ModalRoute.withName(materialApp.initialRoute));
          if (k != materialApp.initialRoute) {
            Navigator.pushNamed(context, k, arguments: arguments);
          }
        },
      ));
    });
    return menuItems;
  }
}
