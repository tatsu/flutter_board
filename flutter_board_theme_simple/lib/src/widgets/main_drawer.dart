import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:path/path.dart' as p;

class MainDrawer extends StatelessWidget {
  MainDrawer({Key key, @required this.arguments}) : super(key: key);

  final PageArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            accountName: Text(arguments.config['author'] ?? ''),
            accountEmail: Text(arguments.config['email'] ?? ''),
            currentAccountPicture: arguments.config['avatar'] != null
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
