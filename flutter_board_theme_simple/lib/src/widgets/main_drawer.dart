import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:path/path.dart' as p;

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder<Config>(
            future: Config.get(),
            builder: (BuildContext context, AsyncSnapshot<Config> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var config = snapshot.data;
                return UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  accountName: Text(config['author'] ?? ''),
                  accountEmail: Text(config['email'] ?? ''),
                  currentAccountPicture: config['avatar'] != null
                      ? CircleAvatar(
                          backgroundImage:
                              AssetImage(p.join('content', config['avatar'])))
                      : CircleAvatar(
                          child: FlutterLogo(size: 42.0),
                          backgroundColor: Colors.white,
                        ),
                );
              }
              return UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              );
            },
          ),
          ..._getMenuItems(context),
        ],
      ),
    );
  }

  List<Widget> _getMenuItems(BuildContext context) {
    var menuItems = <Widget>[];
    var materialApp = context.findAncestorWidgetOfExactType<MaterialApp>();
    materialApp.routes.forEach((k, v) {
      if (v != null) {
        Object page = v(context);
        if (page != null && page is ContentPage) {
          if (page.menuItem != null && page.menuItem is ListTile) {
            ListTile listTile = page.menuItem;
            menuItems.add(ListTile(
              leading: listTile.leading,
              title: listTile.title,
              subtitle: listTile.subtitle,
              trailing: listTile.trailing,
              isThreeLine: listTile.isThreeLine,
              dense: listTile.dense,
              visualDensity: listTile.visualDensity,
              shape: listTile.shape,
              contentPadding: listTile.contentPadding,
              enabled: listTile.enabled,
              onTap: listTile.onTap ??
                  () {
                    Navigator.popUntil(
                        context, ModalRoute.withName(materialApp.initialRoute));
                    if (k != materialApp.initialRoute) {
                      Navigator.pushNamed(context, k);
                    }
                  },
              onLongPress: listTile.onLongPress,
              mouseCursor: listTile.mouseCursor,
              selected: listTile.selected,
              focusColor: listTile.focusColor,
              hoverColor: listTile.hoverColor,
              focusNode: listTile.focusNode,
              autofocus: listTile.autofocus,
              tileColor: listTile.tileColor,
              selectedTileColor: listTile.selectedTileColor,
            ));
          }
        }
      }
    });
    return menuItems;
  }
}
