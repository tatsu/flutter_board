import 'package:flutter/material.dart';
import 'package:flutter_board/flutter_board.dart';
import 'package:flutter_board_theme_simple/flutter_board_theme_simple.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routeGenerator = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    routeGenerator.builderSettingsMap = {
      '/': RouteBuilderSettings(
          builder: (context) => ContentPage(),
          arguments: MenuPageArguments(
            title: 'Home',
            icon: FaIcon(FontAwesomeIcons.home),
          )),
      '/docs': RouteBuilderSettings(
          builder: (context) => ContentPage(),
          subBuilder: (context) => ContentPage(subPage: true),
          arguments: MenuPageArguments(
            title: 'Documents',
            icon: FaIcon(FontAwesomeIcons.folderOpen),
          )),
      '/blog': RouteBuilderSettings(
          builder: (context) => ContentPage(liquid: true),
          subBuilder: (context) => ContentPage(subPage: true, liquid: true),
          arguments: ContentPageArguments(
            title: 'Blog',
            icon: FaIcon(FontAwesomeIcons.blog),
            markdownStyleSheet: MarkdownStyleSheet(
                tableBorder: TableBorder.all(style: BorderStyle.none)),
          )),
      '/about': RouteBuilderSettings(
          builder: (context) => ContentPage(),
          arguments: MenuPageArguments(
            title: 'About',
            icon: FaIcon(FontAwesomeIcons.addressCard),
          )),
      '/contact': RouteBuilderSettings(
          builder: (context) => ContentPage(),
          arguments: MenuPageArguments(
            title: 'Contact',
            icon: FaIcon(FontAwesomeIcons.envelope),
          )),
      '/privacy_policy': RouteBuilderSettings(
          builder: (context) => ContentPage(liquid: true),
          arguments: MenuPageArguments(
            title: 'Privacy Policy',
            icon: FaIcon(FontAwesomeIcons.userShield),
          )),
    };
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: routeGenerator.generateRoute,
      onGenerateInitialRoutes: routeGenerator.generateInitialRoutes,
      title: 'Flutter Board',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
